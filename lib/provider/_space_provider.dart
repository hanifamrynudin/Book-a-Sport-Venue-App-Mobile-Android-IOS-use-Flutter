import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier{

  getRecommendedSpaces() async{

    var result = await http.get('https://playit-b46b1-default-rtdb.asia-southeast1.firebasedatabase.app/');

    print(result.statusCode);
    print(result.body);

  }

}