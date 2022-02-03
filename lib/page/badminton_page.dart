import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:google_signin_example/models/badminton.dart';
import 'package:google_signin_example/provider/_badminton_provider.dart';
import 'package:google_signin_example/provider/_badminton_provider.dart';
import 'package:google_signin_example/theme.dart';
import 'package:google_signin_example/widget/badminton_card.dart';
import 'package:provider/provider.dart';
class BadmintonPage extends StatelessWidget {
  // const BadmintonPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var badmintonProvider = Provider.of<BadmintonProvider>(context);
    badmintonProvider.getRecommendedBadminton();
    
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
                  'Play Badminton',
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
              //     'Badmintonan kuyyy!!!',
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
                  future: badmintonProvider.getRecommendedBadminton(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){

                      List<Badminton> data = snapshot.data;
                      
                      int index = 0;


                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 :20,
                            ),
                            child: BadmintonCard(item),
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