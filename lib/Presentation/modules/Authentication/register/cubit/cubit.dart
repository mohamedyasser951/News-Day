import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Domain/models/user/usermodel.dart';
import 'package:newsapp/Presentation/modules/Authentication/register/cubit/states.dart';

class CubitRegister extends Cubit<RegisterStates> {
  CubitRegister() : super(RegisterInitialState());

  static CubitRegister get(context) => BlocProvider.of(context);

  userRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(name: name, email: email, token: value.user!.uid);
      print("User create successfuly");
    }).catchError((e) {
      emit(RegisterErrorState(e.message));
      print(e.toString());
    });
  }

  void createUser({
    required String name,
    required String email,
    required String token,
  }) async {
    UserModel model = UserModel(
      name: name,
      email: email,
      // bio: "Write your bio",
      token: token,
      // image:
      //     "https://i.pinimg.com/564x/a8/59/4c/a8594c270956433c38513751e3b64c80.jpg",
    );

    FirebaseFirestore.instance
        .collection("Users")
        .doc(token)
        .set(model.toMap())
        .then((value) {
      emit(CreateSuccesState(userModel: model));
    }).catchError((e) {
      emit(CreateErrorState(e.toString()));
    });
  }

  bool isPassword = true;
  IconData sufficIcon = Icons.visibility;

  changeVisibility() {
    isPassword = !isPassword;
    sufficIcon = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(RegisterChangeVisibilityState());
  }
}
