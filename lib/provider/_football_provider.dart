import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_signin_example/models/football.dart';
import 'package:http/http.dart' as http;

class FootballProvider with ChangeNotifier{

  getRecommendedFootball() async{

    var result = await http.get('https://cashop.my.id/api/football.json');

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {

      List data = jsonDecode(result.body);
      List<Football> football = data.map((item) => Football.fromJson(item)).toList();
      return football;
    } else {
      return <Football>[];
    }

  }

}