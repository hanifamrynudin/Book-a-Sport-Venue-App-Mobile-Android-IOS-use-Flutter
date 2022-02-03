import 'package:flutter/material.dart';
// import 'package:google_signin_example/widget/background_painter.dart';
import 'package:google_signin_example/theme.dart';
import 'package:google_signin_example/widget/google_signup_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage("assets/loginfix.png"), fit: BoxFit.cover,),
                  ),
                ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     top: 200,
            //     left: 10,
            //   ),
            //   ),
          buildSignUp(),
        ],
      ),
      ),
      );
  }

  Widget buildSignUp() => Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                'Play.IT',
                style: blackTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),
              ),
          ),
          ),
          SizedBox(
            height: 7,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 250,
              child: Text(
                'Bermain makin mudah dengan bantuan IT!',
                style: greyTextStyle.copyWith(
                  // color: Colors.black54,
                  fontSize: 20,
                  // fontWeight: FontWeight.w600,
                ),
              ),
          ),
          ),
             
          Spacer(),
          Spacer(),
          Spacer(),
          Spacer(),
          Spacer(),
          GoogleSignupButtonWidget(),
          SizedBox(
            height: 45,
          ),
        ],
      );
}
