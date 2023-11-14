import 'package:e_commerce/colors.dart';
import 'package:e_commerce/ui/screens/register_screen/register_screen.dart';
import 'package:e_commerce/utils/defualt_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
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
                      'assets/images/route.png',
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
                DefaultFormField(
                  controller: emailController,
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
                DefaultFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: 'enter your password',
                  isPassword: obSecure,
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        obSecure = !obSecure;
                      });
                    },
                    child: Icon(
                      obSecure == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                ),
                InkWell(
                  onTap: () {},
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
                      'Don’t have an account?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
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
    );
  }
}
