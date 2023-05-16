import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:newsapp/Presentation/modules/Authentication/login/login_screen.dart';
import 'package:newsapp/Presentation/modules/Authentication/register/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Authentication/register/cubit/states.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/news_layout.dart';
import 'package:newsapp/utils/components/components.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/Data/Data%20Source/local/sheredpref_helper.dart';
import 'package:newsapp/utils/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitRegister, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              textColor: Colors.white,
              backgroundColor: Colors.red);
        }
        if (state is CreateSuccesState) {
          SharedHelper.saveData(key: "token", value: state.userModel.token)
              .then((value) {
            Token = state.userModel.token;
            naviagetAndKill(context: context, widget: NewsLayout());
          }).catchError((e) {
            print(e.toString());
          });
          //   SharedHelper.saveData(key: "uId", value: state.userModel.uId)
          //       .then((value) {
          //     uId = state.userModel.uId;
          //     navigateAndFinish(context: context, widget: HomeLayout());
          //     //  customizedToast(message: message, toastState: ToastState.SUCESS);
          //   }).catchError((error) {});
          // } else {
          //   // customizedToast(message: message, toastState: ToastState.Error);
        }
      },
      builder: (context, state) {
        var cubit = CubitRegister.get(context);
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: Form(
              key: formkey,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sign Up ",
                                  style: headingStyle.copyWith(
                                      color:
                                          AppNewsCubit.get(context).isDarkMode
                                              ? Colors.white
                                              : Colors.black)),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                "Follow the simple steps",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        CustomizedTextfield(
                          myController: nameController,
                          hintText: "Name",
                          isPassword: false,
                          prefixIcon: Icons.person,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Username must be failed!";
                            }
                            return null;
                          },
                        ),
                        CustomizedTextfield(
                          myController: emailController,
                          hintText: "Email",
                          isPassword: false,
                          prefixIcon: Icons.email,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Email must be failed!";
                            }
                            return null;
                          },
                        ),
                        CustomizedTextfield(
                          myController: passwordController,
                          hintText: "Password",
                          prefixIcon: Icons.lock,
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
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          builder: (context) => CustomizedButton(
                            buttonColor: Theme.of(context).primaryColor,
                            buttonText: "Sign Up",
                            onPressed: () async {
                              // buildGoTo(context: context, widget: NewsLayout());
                              if (formkey.currentState!.validate()) {
                                cubit.userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            textColor: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account ?",
                                style: Theme.of(context).textTheme.bodyText2),
                            TextButton(
                              onPressed: (() {
                                buildGoTo(
                                    context: context, widget: LoginScreen());
                              }),
                              child: Text("Sign in",
                                  style: TextStyle(
                                    color: primColor,
                                    fontSize: 15,
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
