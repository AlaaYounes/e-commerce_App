import 'package:e_commerce/domain/entities/authentication/RegisterResponseEntity.dart';

class RegisterScreenStates {}

class RegisterInitialState extends RegisterScreenStates {}

class RegisterLoadingState extends RegisterScreenStates {
  String? loadingMessage;

  RegisterLoadingState({required this.loadingMessage});
}

class RegisterErrorState extends RegisterScreenStates {
  String errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterScreenStates {
  RegisterResponseEntity response;

  RegisterSuccessState({required this.response});
}
