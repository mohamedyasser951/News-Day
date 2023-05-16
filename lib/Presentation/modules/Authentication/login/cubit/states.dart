class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccesState extends LoginStates {
  final String token;
  
  LoginSuccesState({required this.token});
}

class LoginErrorState extends LoginStates {
  String error;
  LoginErrorState(this.error);
}

class LoginChangeVisibilityState extends LoginStates {}
