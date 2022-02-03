import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_signin_example/models/futsal.dart';
import 'package:http/http.dart' as http;

class FutsalProvider with ChangeNotifier{

  getRecommendedFutsal() async{

    var result = await http.get('https://cashop.my.id/api/futsal.json');

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {

      List data = jsonDecode(result.body);
      List<Futsal> futsal = data.map((item) => Futsal.fromJson(item)).toList();
      return futsal;
    } else {
      return <Futsal>[];
    }

  }

}