import 'package:flutter/material.dart';
import 'package:google_signin_example/models/futsal.dart';
import 'package:google_signin_example/page/error_page.dart';
import 'package:google_signin_example/theme.dart';
import 'package:google_signin_example/widget/facility_item.dart';
import 'package:google_signin_example/widget/rating_item.dart';
import 'package:google_signin_example/widget/futsal_card.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailFutsalPage extends StatelessWidget {

  final Futsal futsal;

  DetailFutsalPage(this.futsal);

  @override
  Widget build(BuildContext context) {

    launchUrl(String url) async{
      if(await canLaunch(url)){
        launch(url);
      }else{
        // throw(url);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ErrorPage(),
          ));
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              futsal.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 270,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 218,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  futsal.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),              
                                Text.rich(
                                  TextSpan(
                                    text: '\Start from ',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 15,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Rp. ${futsal.price}',
                                        style: purpleTextStyle.copyWith(
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' / 10 laps',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1,2,3,4,5].map((index){
                                return Container(
                                  child: RatingItem(
                                    index: index,
                                    rating: futsal.rating,
                                    ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // NOTE: PHOTO
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: futsal.photos.map((item) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: 24,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      // Sizer
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${futsal.address}',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: (){
                                launchUrl('${futsal.mapUrl}');
                              },
                              child: Image.asset(
                                'assets/map.png',
                                width: 50,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Informations',
                          style: regularTextStyle.copyWith(
                            fontSize: 18,
                          ), 
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${futsal.info}',
                              style: greyTextStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: edge
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width-(2*edge),
                  child: RaisedButton(
                    onPressed: (){
                      launchUrl('${futsal.phone}');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)
                      ),
                    color: purpleColor,
                    child: 
                      Text(
                        'Book Now',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                        ),
                        ),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap:() {
                      Navigator.pop(context);
                      },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ,),
    );
  }
}