import 'package:flutter/material.dart';
import 'package:pfe_2021/model/model_bilirubine.dart';
import 'package:pfe_2021/model/model_clairance.dart';
import 'package:pfe_2021/model/model_tgo_tgp.dart';
import 'package:pfe_2021/ui/add_med.dart';
import 'package:pfe_2021/ui/adopy_poso.dart';
import 'package:pfe_2021/ui/list_med.dart';
import 'package:pfe_2021/ui/menu.dart';
import 'package:pfe_2021/ui/searching_details.dart';
import 'package:pfe_2021/ui/start.dart';

import 'model/model_medicament.dart';
Medicament med_search;
List join_med;
String selected_item = null;
int selected_id;
Clairance med_clr;
Bilirubine med_bil;
Tgo_tgp med_tgo;
//liste qui va contenir la liste des medicament
List meds;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Start(),

    routes: {
      Menu.id: (context) => Menu(),
      List_med.id: (context) => List_med(),
      Add_med.id: (context) => Add_med(),
      adopt_poso.id: (context) => adopt_poso(),
      Start.id: (context) => Start(),
      Searching_details.id: (context) => Searching_details(),
    },));
}
