import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
class MainProvider{

  MainProvider(){
    getData();
  }

  Future getData() async{
    final strData = await rootBundle.loadString('data/data.json');
    Map jsonData = json.decode(strData);
    return jsonData['questions'];
  }
}

final mainProvider = MainProvider();