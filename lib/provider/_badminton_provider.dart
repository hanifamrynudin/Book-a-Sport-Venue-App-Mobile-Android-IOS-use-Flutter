import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_signin_example/models/badminton.dart';
import 'package:http/http.dart' as http;

class BadmintonProvider with ChangeNotifier{

  getRecommendedBadminton() async{

    var result = await http.get('https://cashop.my.id/api/badminton.json');

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {

      List data = jsonDecode(result.body);
      List<Badminton> badminton = data.map((item) => Badminton.fromJson(item)).toList();
      return badminton;
    } else {
      return <Badminton>[];
    }

  }

}