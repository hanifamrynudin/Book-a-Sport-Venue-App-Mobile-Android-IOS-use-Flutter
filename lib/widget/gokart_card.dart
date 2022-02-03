import 'package:google_signin_example/models/gokart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_signin_example/page/detail_gokart_page.dart';
import 'package:google_signin_example/theme.dart';

class GokartCard extends StatelessWidget {
  
  final Gokart gokart;

  GokartCard(this.gokart);

  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context)=>DetailGokartPage(gokart),
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
                    gokart.imageUrl,
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
                            '${gokart.rating}/5',
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
                gokart.name,
                style: blackTextStyle.copyWith(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  text: 'Rp.${gokart.price}',
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
                        text: 'until ${gokart.city} today',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: '\n${gokart.country}',
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