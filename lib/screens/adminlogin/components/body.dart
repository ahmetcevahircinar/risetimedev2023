import 'package:flutter/material.dart';
import 'package:risetimedev2023/pages/dailydatasView.dart';
import 'package:risetimedev2023/screens/Login/components/background.dart';
import 'package:risetimedev2023/components/rounded_button.dart';
import 'package:risetimedev2023/components/rounded_password_field.dart';
import 'package:risetimedev2023/services/general/general_methods.dart';

class Body extends StatelessWidget {
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
              "ADMIN LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/risetime_logo.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedPasswordField(
              onChanged: (value) {
                user_password = value;
              },
            ),
            RoundedButton(
              text: "ADMIN LOGIN",
              press: () => {
                user_password == "cevahir"
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DailyDatasView();
                          },
                        ),
                      )
                    : showAlert("Error", "The password is not correct!", context)
              },
            ),
          ],
        ),
      ),
    );
  }
}
