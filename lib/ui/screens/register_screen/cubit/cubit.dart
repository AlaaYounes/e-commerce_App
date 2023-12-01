import 'package:e_commerce/domain/useCase/authentication/register_useCase.dart';
import 'package:e_commerce/ui/screens/register_screen/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenCubit extends Cubit<RegisterScreenStates> {
  RegisterUseCase? registerUseCase;

  RegisterScreenCubit({this.registerUseCase}) : super(RegisterInitialState());
  var nameController = TextEditingController(text: 'alaa');
  var emailController = TextEditingController(text: 'alaa@gmail.com');
  var passwordController = TextEditingController(text: '123456');
  var rePasswordController = TextEditingController(text: '123456');
  var phoneController = TextEditingController(text: '01023525489');
  bool obSecure = true;
  var formKey = GlobalKey<FormState>();

  Future<void> register() async {
    emit(RegisterLoadingState(loadingMessage: 'Loading...'));

    var response = await registerUseCase!.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);
    response.fold((l) {
      emit(RegisterErrorState(errorMessage: l.errorMessage!));
    }, (r) {
      emit(RegisterSuccessState(response: r));
    });
  }
}
