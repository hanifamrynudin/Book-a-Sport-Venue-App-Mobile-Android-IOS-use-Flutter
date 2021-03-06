import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_signin_example/theme.dart';
import 'package:google_signin_example/extensions/extensions.dart';

class DateCard extends StatelessWidget {
  final bool isSelected;
  final double width;
  final double height;
  final DateTime date;
  final Function onTap;

  DateCard(this.date,
      {this.isSelected = false, this.width = 70, this.height = 90, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isSelected ? orangeColor : Colors.transparent,
            border: Border.all(
                color: isSelected ? Colors.transparent : Color(0xFFE4E4E4))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              date.shortDayName,
              style: blackTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              date.day.toString(),
              style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
