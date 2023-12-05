import 'package:e_commerce/domain/injection.dart';
import 'package:e_commerce/ui/screens/login_screen/login_screen.dart';
import 'package:e_commerce/ui/screens/register_screen/cubit/cubit.dart';
import 'package:e_commerce/ui/screens/register_screen/cubit/states.dart';
import 'package:e_commerce/utils/assets/colors.dart';
import 'package:e_commerce/utils/assets/images.dart';
import 'package:e_commerce/utils/components/custom_form_field.dart';
import 'package:e_commerce/utils/components/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenCubit viewModel =
      RegisterScreenCubit(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenCubit, RegisterScreenStates>(
      bloc: viewModel,
      listener: (BuildContext context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context);
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage, () {});
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.response.token, () {});
        } else {
          Container();
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .07,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .237),
                      child: Image.asset(
                        AppImages.routeLogo,
                        height: 100,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .08,
                  ),
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    controller: viewModel.nameController,
                    hintText: 'enter your full name',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    controller: viewModel.emailController,
                    hintText: 'enter your email',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    controller: viewModel.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'enter your password',
                    isPassword: viewModel.obSecure,
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          viewModel.obSecure = !viewModel.obSecure;
                        });
                      },
                      child: Icon(
                        viewModel.obSecure == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  Text(
                    'Confirm Password',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    controller: viewModel.rePasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'confirm your password',
                    isPassword: viewModel.obSecure,
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          viewModel.obSecure = !viewModel.obSecure;
                        });
                      },
                      child: Icon(
                        viewModel.obSecure == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  Text(
                    'Mobile Number',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    controller: viewModel.phoneController,
                    hintText: 'enter your mobile no.',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .08,
                  ),
                  InkWell(
                    onTap: () {
                      viewModel.register();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.whiteColor,
                      ),
                      child: Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Login now',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
