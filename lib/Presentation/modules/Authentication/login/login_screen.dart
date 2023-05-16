import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:newsapp/Presentation/modules/Authentication/login/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Authentication/login/cubit/states.dart';
import 'package:newsapp/Presentation/modules/Authentication/register/register_screen.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/news_layout.dart';
import 'package:newsapp/utils/components/components.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/Data/Data%20Source/local/sheredpref_helper.dart';
import 'package:newsapp/utils/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitLogin, LoginStates>(listener: (context, state) {
      if (state is LoginErrorState) {
        Fluttertoast.showToast(
            msg: state.error,
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.white,
            backgroundColor: Colors.red);
      }

      if (state is LoginSuccesState) {
        SharedHelper.saveData(key: "token", value: state.token).then((value) {
          Token = state.token;
          naviagetAndKill(context: context, widget: NewsLayout());
        }).catchError((e) {
          print(e.toString());
        });
      }
    }, builder: (context, state) {
      var cubit = CubitLogin.get(context);
      return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30.0, horizontal: 10),
                            child: Text("Sign In",
                                style: headingStyle.copyWith(
                                  color: AppNewsCubit.get(context).isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                )),
                          ),
                          CustomizedTextfield(
                            prefixIcon: Icons.email,
                            hintText: "Email",
                            myController: email,
                            isPassword: false,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Email must be failed!";
                              }
                              return null;
                            },
                          ),
                          CustomizedTextfield(
                            prefixIcon: Icons.lock,
                            hintText: "Password",
                            myController: password,
                            isPassword: cubit.isPassword,
                            suffixIcon: cubit.sufficIcon,
                            suffixPressed: () {
                              cubit.changeVisibility();
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Password must be failed!";
                              }
                              return null;
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => const ForgotPassword()));
                                },
                                child: const Text("Forgot Password?",
                                    style: TextStyle(
                                      color: Color(0xff6A707C),
                                      fontSize: 14,
                                    )),
                              ),
                            ),
                          ),
                          ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            builder: (context) => CustomizedButton(
                              buttonText: "Sign In",
                              buttonColor: primColor,
                              textColor: Colors.white,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  cubit.userLogin(
                                      email: email.text,
                                      password: password.text);
                                }
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account ?",
                                  style: Theme.of(context).textTheme.bodyText2),
                              TextButton(
                                onPressed: (() {
                                  buildGoTo(
                                      context: context,
                                      widget: RegisterScreen());
                                }),
                                child: Text("Sign Up",
                                    style: TextStyle(
                                      color: primColor,
                                      fontSize: 15,
                                    )),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
