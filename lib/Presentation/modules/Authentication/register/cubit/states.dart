//11111111111

import 'package:newsapp/Domain/models/user/usermodel.dart';

class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccesState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String error;
  RegisterErrorState(this.error);
}

class CreateLoadingState extends RegisterStates {}

class CreateSuccesState extends RegisterStates {
  final UserModel userModel;

  CreateSuccesState({required this.userModel});
}

class CreateErrorState extends RegisterStates {
  String error;
  CreateErrorState(this.error);
}

class RegisterChangeVisibilityState extends RegisterStates {}
