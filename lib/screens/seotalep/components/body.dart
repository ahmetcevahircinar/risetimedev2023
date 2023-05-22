import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:risetimedev2023/Screens/Signup/components/background.dart';
import 'package:risetimedev2023/components/rounded_button.dart';
import 'package:risetimedev2023/components/rounded_input_field.dart';
import 'package:risetimedev2023/services/auth/auth_methods.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  String user_name = "";
  String user_email = "";
  String user_password = "";

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Looged as: " +  firebaseUser.email!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "SEND SEO REQUEST",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedInputField(
              hintText: "Your Name",
              onChanged: (value) {
                user_name = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Mobile Phone",
              onChanged: (value) {
                user_name = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                user_email = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Web Address",
              onChanged: (value) {
                user_email = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Keywords",
              onChanged: (value) {
                user_email = value;
              },
            ),
            RoundedInputField(
              hintText: "Description",
              onChanged: (value) {
                user_email = value;
              },
            ),
            RoundedButton(
              text: "SEND SEO REQUEST",
              press: () {
                context
                    .read<FlutterFireAuthService>()
                    .createAccount(user_name, user_email, user_password);
              },
            ),
            RoundedButton(
              text: "LOG OUT",
              press: () {
                context
                    .read<FlutterFireAuthService>()
                    .logOut(context);
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
