import 'package:google_signin_example/models/football.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_signin_example/page/detail_football_page.dart';
import 'package:google_signin_example/theme.dart';

class FootballCard extends StatelessWidget {
  
  final Football football;

  FootballCard(this.football);

  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context)=>DetailFootballPage(football),
            ),
          );
        },

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    football.imageUrl,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Icon_star.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            '${football.rating}/5',
                            style: whiteTextStyle.copyWith(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                football.name,
                style: blackTextStyle.copyWith(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  text: 'Rp.${football.price}',
                  style:  purpleTextStyle.copyWith(
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: ' / 10 laps',
                      style: greyTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
                Text.rich(
                  TextSpan(
                    text: '\OPEN ',
                    style: purpleTextStyle.copyWith(
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: 'until ${football.city} today',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: '\n${football.country}',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}