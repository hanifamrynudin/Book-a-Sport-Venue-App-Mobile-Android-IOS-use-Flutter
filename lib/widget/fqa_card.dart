import 'package:google_signin_example/theme.dart';
import 'package:flutter/material.dart';

class FqaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/tips2.png', 
          width: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fqa',
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "Updated 02 May",
              style: greyTextStyle,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.chevron_right,
            size: 24,
            color: greyColor,
            ),
        ),
      ],
    );
  }
}