import 'package:e_commerce/domain/entities/LoginResponseEntity.dart';

class LoginScreenStates {}

class LoginInitialState extends LoginScreenStates {}

class LoginLoadingState extends LoginScreenStates {
  String? loadingMessage;

  LoginLoadingState({required this.loadingMessage});
}

class LoginErrorState extends LoginScreenStates {
  String errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginScreenStates {
  LoginResponseEntity response;

  LoginSuccessState({required this.response});
}
