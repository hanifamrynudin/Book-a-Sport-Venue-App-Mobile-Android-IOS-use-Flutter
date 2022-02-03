import 'package:google_signin_example/models/space.dart';
import 'package:google_signin_example/page/detail_page.dart';
import 'package:google_signin_example/theme.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  
  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context)=>DetailPage(space),
            ),
          );
        },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
            width: 110,
            height: 95,
            child: Stack(
                alignment: Alignment.topCenter,
                children: [ 
                  Image.network(
                  space.imageUrl,
                  width: 110,
                  height: 95,
                  fit: BoxFit.cover,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          color: orangeColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/Icon_star_solid.png',
                                width: 20,
                                height: 20,
                            ),
                            Text(
                              '${space.rating}/5',
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text.rich(
                TextSpan(
                  text: '\Start from',
                  style: greyTextStyle.copyWith(
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(
                      text: ' Rp.${space.price}',
                      style: purpleTextStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    TextSpan(
                      text: ' / hour',
                      style: greyTextStyle.copyWith(
                        fontSize: 13
                    )
                    )],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              
              Text.rich(
                TextSpan(
                  text: '\OPEN ',
                  style: purpleTextStyle.copyWith(
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(
                      text: 'until ${space.city} today',
                      style: greyTextStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    TextSpan(
                      text: '\n${space.country}',
                      style: greyTextStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}