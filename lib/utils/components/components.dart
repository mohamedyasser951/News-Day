import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/Presentation/modules/Authentication/login/login_screen.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Data/Data%20Source/local/sheredpref_helper.dart';

class CustomizedTextfield extends StatelessWidget {
  final TextEditingController myController;
  final String? hintText;
  final String? label;
  final bool? isPassword;
  final Function? suffixPressed;
  final String? Function(String? val) validator;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  const CustomizedTextfield(
      {Key? key,
      required this.myController,
      this.hintText,
      this.isPassword,
      this.suffixIcon,
      this.suffixPressed,
      required this.validator,
      this.prefixIcon,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: TextFormField(
          style: AppNewsCubit.get(context).isDarkMode
              ? TextStyle(color: Colors.white)
              : TextStyle(color: Colors.black),
          validator: validator,
          controller: myController,
          keyboardType: isPassword!
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          enableSuggestions: isPassword! ? false : true,
          autocorrect: isPassword! ? false : true,
          obscureText: isPassword ?? true,
          decoration: InputDecoration(
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon, color: Colors.grey),
                    onPressed: () {
                      suffixPressed!();
                    },
                  )
                : null,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            hintText: hintText,
          ),
        ));
  }
}

class CustomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final IconData? prefixIcon;
  const CustomizedButton(
      {Key? key,
      this.prefixIcon,
      this.buttonText,
      this.buttonColor,
      this.onPressed,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
            height: 48,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(4.0)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefixIcon != null)
                  FaIcon(
                    prefixIcon,
                    size: 22,
                    color: Colors.white,
                  ),
                if (prefixIcon != null)
                  const SizedBox(
                    width: 8,
                  ),
                Text(
                  buttonText!,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ))),
      ),
    );
  }
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        height: 0.5,
        width: double.infinity,
        color: Colors.grey,
      ),
    );

Widget? buildGoTo({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Widget? naviagetAndKill(
    {required BuildContext context, required Widget widget}) {
   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => widget ),(route) => false,);

}

Widget myTab(String text) {
  return Text(
    text,
  );
}

Logout(BuildContext context) {
  print("logout");
  SharedHelper.removeData(key: 'token').then((value) {
    if (value) {
      naviagetAndKill(context: context, widget: LoginScreen());
    }
  });
}
