import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/Presentation/modules/Authentication/login/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Authentication/login/cubit/states.dart';
import 'package:newsapp/Presentation/modules/Authentication/login/login_screen.dart';
import 'package:newsapp/Presentation/modules/on_boarding/on_boarding.dart';

import 'package:newsapp/utils/components/components.dart';
import 'package:newsapp/utils/app_colors.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitLogin, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CubitLogin.get(context);
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              actions: [
                Row(
                  children: [
                    InkWell(
                      child: Text(
                        "Skip",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onTap: () => buildGoTo(
                          context: context, widget: OnBoardingScreen()),
                    ),
                    IconButton(
                      icon: const Icon(Icons.language_sharp),
                      onPressed: () {
                      },
                    ),
                  ],
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/NH.png"),
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Welocme to ",
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("News", style: TextStyle(fontSize: 20)),
                            Text(
                              "Day",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    const Text("Sign in to Continue",
                        style: TextStyle(color: Colors.grey)),
                    const SizedBox(
                      height: 70.0,
                    ),
                    CustomizedButton(
                      prefixIcon: FontAwesomeIcons.google,
                      buttonColor: Colors.blue,
                      buttonText: "Sign in with Google",
                      textColor: Colors.white,
                      onPressed: () {
                        // cubit.signInWithGoogle();
                      },
                    ),
                    CustomizedButton(
                      prefixIcon: FontAwesomeIcons.facebook,
                      buttonColor: Colors.blueAccent,
                      buttonText: "Sign in with Facebook",
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    CustomizedButton(
                      prefixIcon: FontAwesomeIcons.apple,
                      buttonColor: Colors.black87,
                      buttonText: "Sign in with Apple",
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      "Don't have Social account ?",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    InkWell(
                      child: Text("Continue with Email > >",
                          style: TextStyle(color: primColor)),
                      onTap: () =>
                          buildGoTo(context: context, widget: LoginScreen()),
                    ),
                  ]),
                ),
              ),
            ),
          );
        });
  }
}
