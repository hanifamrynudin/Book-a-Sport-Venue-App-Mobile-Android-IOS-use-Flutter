import 'package:google_signin_example/page/badminton_page.dart';
import 'package:google_signin_example/page/detail_page.dart';
import 'package:google_signin_example/page/football_page.dart';
import 'package:google_signin_example/page/futsal_page.dart';
import 'package:google_signin_example/page/gokart_page.dart';
import 'package:google_signin_example/provider/google_sign_in.dart';
import 'package:google_signin_example/theme.dart';
import 'package:google_signin_example/widget/city_card.dart';
import 'package:google_signin_example/models/city.dart';
import 'package:google_signin_example/widget/space_card.dart';
import 'package:google_signin_example/models/space.dart';
import 'package:google_signin_example/widget/tips_card.dart';
import 'package:google_signin_example/widget/fqa_card.dart';
import 'package:google_signin_example/widget/bottom_navbar_item.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var spaceProvider = Provider.of<GoogleSignInProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
          child: ListView(
            children: [
              SizedBox(
                height: edge,
              ),
              // NOTE: TITLE/HEADER
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Hi, '+ user.displayName,
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Cobain layanan kami yaa..',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),


              Container(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    InkWell(
                        child: 
                            CityCard(
                              City(
                                id: 1,
                                name : 'Play Futsal',
                                imageUrl: 'assets/futsal.png',
                              ),
                            ),
                        onTap: () { 
                          Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context)=>FutsalPage(),
                              ),
                            );
                        },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                        child: 
                            CityCard(
                              City(
                                id: 2,
                                name : 'Play Football',
                                imageUrl: 'assets/football.png',
                              ),
                            ),
                        onTap: () { 
                          Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context)=>FootballPage(),
                              ),
                            );
                        },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                        child: 
                            CityCard(
                              City(
                                id: 3,
                                name : 'Play Badminton',
                                imageUrl: 'assets/badminton.png',
                              ),
                            ),
                        onTap: () { 
                          Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context)=>BadmintonPage(),
                              ),
                            );
                        },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                        child: 
                            CityCard(
                              City(
                                id: 1,
                                name : 'Play GoKart',
                                imageUrl: 'assets/gokart.png',
                              ),
                            ),
                        onTap: () { 
                          Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context)=>GokartPage(),
                              ),
                            );
                        },
                    ),
                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              // NOTE: RECOMMENDED
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Recommended',
                  style: regularTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: 
                  FutureBuilder(
                    future: spaceProvider.getRecommendedSpaces(),
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        List<Space> data = snapshot.data;

                        int index = 0;

                      return Column(
                          children: data.map((item){
                            index++;
                            return Container(
                              margin: EdgeInsets.only(
                                top: index == 1 ? 0 : 18, 
                              ),
                              child: SpaceCard(item),
                            );
                          }).toList(),
                        );
                      }
                      return Center(child: CircularProgressIndicator(),);
                    },
                )
              ),
              // NOTE: TIPS
              SizedBox(
                height: 34,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Tips & Guidence',
                  style: regularTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: Column(
                    children: [
                      TipsCard(),
                      SizedBox(
                        height: 20,
                      ),
                      FqaCard(),
                    ],
                  ),
                ),
              
              SizedBox(
                height: 70,
              ),
              
                SizedBox(
                  height: 16,
                ),
          ],
        ),
      ),
      floatingActionButton: Container(
                height: 55,
                width: MediaQuery.of(context).size.width - (3 * edge),
                margin: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF6F7F8),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavbarItem(
                      imageUrl: 'assets/icon_home.png',
                      // isActive: true,
                    ),
                    InkWell(
                      onTap: (){
                        showAlertDialog(context);
                        },
                      child: BottomNavbarItem(
                        imageUrl: 'assets/logout.png',
                        // isActive: false,
                      ),
                    ),
                ],
                ),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}


showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed:  () {
      final provider =
      Provider.of<GoogleSignInProvider>(context, listen: false);
      provider.logout();
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("AlertDialog"),
    content: Text("Are you sure?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}