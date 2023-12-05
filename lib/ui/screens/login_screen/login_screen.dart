import 'package:e_commerce/domain/injection.dart';
import 'package:e_commerce/ui/screens/app_layout/app_layout.dart';
import 'package:e_commerce/ui/screens/login_screen/cubit/cubit.dart';
import 'package:e_commerce/ui/screens/login_screen/cubit/states.dart';
import 'package:e_commerce/ui/screens/register_screen/register_screen.dart';
import 'package:e_commerce/utils/assets/colors.dart';
import 'package:e_commerce/utils/assets/images.dart';
import 'package:e_commerce/utils/components/custom_form_field.dart';
import 'package:e_commerce/utils/components/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var viewModel = LoginScreenCubit(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenCubit, LoginScreenStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context);
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage, () {
            Navigator.pop(context);
          });
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.response.user?.name ?? '', () {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AppLayout(),
              ),
            );
          });
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
                    'Welcome Back To Route',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: Theme.of(context).textTheme.bodySmall,
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
                    height: MediaQuery.of(context).size.height * .08,
                  ),
                  InkWell(
                    onTap: () {
                      viewModel.login();
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
                        'Login',
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
                        'Don’t have an account ?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Create Account',
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
