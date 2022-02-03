import 'package:google_signin_example/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_signin_example/models/city.dart';

class CityCard extends StatelessWidget {

  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        // height: 10,
        width: 90,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            SizedBox(
              height: 14,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [ 
                Image.asset(
                city.imageUrl,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
          Align(
            alignment: Alignment.center,
            child:
              Text(
                city.name,
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
          ],
        ),
      ),
    );
  }
}