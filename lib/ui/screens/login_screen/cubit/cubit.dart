import 'package:e_commerce/domain/useCase/authentication/login_useCase.dart';
import 'package:e_commerce/ui/screens/login_screen/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenCubit extends Cubit<LoginScreenStates> {
  LoginUseCase? loginUseCase;

  LoginScreenCubit({this.loginUseCase}) : super(LoginInitialState());
  var emailController = TextEditingController(text: 'alaayounes@gmail.com');
  var passwordController = TextEditingController(text: '123456');
  bool obSecure = true;
  var formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(LoginLoadingState(loadingMessage: 'Loading...'));
    var response = await loginUseCase!.invoke(
      emailController.text,
      passwordController.text,
    );
    response.fold((l) {
      emit(LoginErrorState(errorMessage: l.errorMessage!));
    }, (r) {
      emit(LoginSuccessState(response: r));
    });
  }
}
