import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  const GoogleSignupButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: OutlinedButton.icon(
        label: Text(
          'Sign In With Google',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
        onPressed: (){
          final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.login();
        },
      ),
    );
  }
}
