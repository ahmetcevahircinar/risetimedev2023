import 'package:flutter/material.dart';
import 'package:risetimedev2023/Screens/Login/components/background.dart';
import 'package:risetimedev2023/Screens/Signup/signup_screen.dart';
import 'package:risetimedev2023/components/already_have_an_account_acheck.dart';
import 'package:risetimedev2023/components/rounded_button.dart';
import 'package:risetimedev2023/components/rounded_input_field.dart';
import 'package:risetimedev2023/components/rounded_password_field.dart';
import 'package:risetimedev2023/screens/signup/signup_screen.dart';
import 'package:risetimedev2023/services/auth/auth_methods.dart';
import 'package:provider/provider.dart';


class Body extends StatelessWidget {
  String user_email = "";
  String user_password = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/risetime_logo.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                user_email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                user_password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                context
                    .read<FlutterFireAuthService>()
                    .logIn(user_email, user_password, context);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.popAndPushNamed(context, "signup");
              },
            ),
          ],
        ),
      ),
    );
  }
}
