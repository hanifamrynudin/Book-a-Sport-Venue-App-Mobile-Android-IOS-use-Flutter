import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_signin_example/models/gokart.dart';
import 'package:http/http.dart' as http;

class GokartProvider with ChangeNotifier{

  getRecommendedGokart() async{

    var result = await http.get('https://cashop.my.id/api/gokart.json');

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {

      List data = jsonDecode(result.body);
      List<Gokart> gokart = data.map((item) => Gokart.fromJson(item)).toList();
      return gokart;
    } else {
      return <Gokart>[];
    }

  }

}