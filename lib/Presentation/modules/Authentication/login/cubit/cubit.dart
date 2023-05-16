import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Presentation/modules/Authentication/login/cubit/states.dart';

class CubitLogin extends Cubit<LoginStates> {
  CubitLogin() : super(LoginInitialState());

  static CubitLogin get(context) => BlocProvider.of(context);

  userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccesState(token: value.user!.uid));
    }).catchError((e) {
      emit(LoginErrorState(e.message));
    });
  }

  bool isPassword = true;
  IconData sufficIcon = Icons.visibility;

  changeVisibility() {
    isPassword = !isPassword;
    sufficIcon = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginChangeVisibilityState());
  }
}
