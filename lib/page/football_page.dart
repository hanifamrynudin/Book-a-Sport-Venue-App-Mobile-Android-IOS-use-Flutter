import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:google_signin_example/models/football.dart';
import 'package:google_signin_example/provider/_football_provider.dart';
import 'package:google_signin_example/provider/_football_provider.dart';
import 'package:google_signin_example/theme.dart';
import 'package:google_signin_example/widget/football_card.dart';
import 'package:provider/provider.dart';
class FootballPage extends StatelessWidget {
  // const FootballPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var footballProvider = Provider.of<FootballProvider>(context);
    footballProvider.getRecommendedFootball();
    
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Play Football',
                  style: blackTextStyle.copyWith(
                    fontSize: 24
                  ),
                ),
              ),
              // SizedBox(
              //   height: 2,
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: edge),
              //   child: Text(
              //     'Footballan kuyyy!!!',
              //     style: greyTextStyle.copyWith(
              //       fontSize: 16
              //     )
              //   ),
              // ),

              SizedBox(
                height: 15,
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: 
                
                FutureBuilder(
                  future: footballProvider.getRecommendedFootball(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){

                      List<Football> data = snapshot.data;
                      
                      int index = 0;


                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 :20,
                            ),
                            child: FootballCard(item),
                          );
                        }).toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              ),
            SizedBox(
              height: 30,
            ),

            ],
          ),
        )
      )
    );
  }
}