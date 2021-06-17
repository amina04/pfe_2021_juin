import 'package:flutter/material.dart';
import 'package:pfe_2021_juin/screens/add_medi_screen.dart';
import 'package:pfe_2021_juin/screens/dose_screen.dart';
import 'package:pfe_2021_juin/screens/list_medi_screen.dart';


import 'model/model_bilirubine.dart';
import 'model/model_clairance.dart';
import 'model/model_medicament.dart';
import 'model/model_tgo_tgp.dart';
import 'screens/welcom_screen.dart';
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
    home: Welcome_screen(),

    routes: {
      list_med_screen.id: (context) => list_med_screen(),
      dose_screen.id: (context) => dose_screen(),
      Add_med_screen.id: (context) => Add_med_screen(),

    },));
}


