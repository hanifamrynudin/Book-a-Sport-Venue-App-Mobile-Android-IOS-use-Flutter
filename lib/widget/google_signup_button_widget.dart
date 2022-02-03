import 'package:flutter/material.dart';
import 'package:google_signin_example/provider/google_sign_in.dart';
import 'package:google_signin_example/theme.dart';
import 'package:provider/provider.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: RaisedButton.icon(
          label: Text(
            'Sign In With Google',
            style: blackTextStyle.copyWith(
              fontSize: 20
            ),
          ),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          // highlightedBorderColor: Colors.black,
          // borderSide: BorderSide(color: Colors.black),
          color: Colors.white,
          textColor: Colors.black,
          icon: Image.asset(
            'assets/google.png',
            width: 46,
          ),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
        ),
      );
}
