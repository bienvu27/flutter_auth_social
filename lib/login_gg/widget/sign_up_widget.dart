import 'package:flutter/material.dart';

import 'google_signup_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 175,
            child: Text('Welcome Back To MyApp',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
        ),
        Spacer(),
        GoogleSignupButtonWidget(),
        const SizedBox(height: 12,),
        Text('Login to continue', style: TextStyle(fontSize: 16),),
        Spacer(),
      ],
    );
  }
}
