import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:google_signin_example/models/gokart.dart';
import 'package:google_signin_example/provider/_gokart_provider.dart';
import 'package:google_signin_example/provider/_gokart_provider.dart';
import 'package:google_signin_example/theme.dart';
import 'package:google_signin_example/widget/gokart_card.dart';
import 'package:provider/provider.dart';
class GokartPage extends StatelessWidget {
  // const GokartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gokartProvider = Provider.of<GokartProvider>(context);
    gokartProvider.getRecommendedGokart();
    
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
                  'Play GoKart',
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
              //     'Gokartan kuyyy!!!',
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
                  future: gokartProvider.getRecommendedGokart(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){

                      List<Gokart> data = snapshot.data;
                      
                      int index = 0;


                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 :20,
                            ),
                            child: GokartCard(item),
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