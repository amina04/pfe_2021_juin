import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe_2021_juin/controller/adopt_poso_controller.dart';
import 'package:pfe_2021_juin/controller/functions.dart';
import 'package:pfe_2021_juin/model/database.dart';
import 'package:pfe_2021_juin/model/model_medicament.dart';
import 'package:pfe_2021_juin/screens/add_medi_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:pfe_2021_juin/screens/list_medi_screen.dart';

import '../main.dart';
class dose_screen extends StatefulWidget {
  static String id = 'dose_screen';
  @override
  _dose_screenState createState() => _dose_screenState();
}

class _dose_screenState extends State<dose_screen> {
  var dbmanager = new Dbpfe();

  @override
  List<DropdownMenuItem> getDropDownItem() {

    //es val initiale de text field
    clairance_cntrl.text='0';
    bilurbine_cntrl.text='0';
    tgo_cntrl.text='0';
    List<DropdownMenuItem<String>> dropdownitems = [];
    for (int i = 0; i < meds.length; i++) {
      //  extrait le nom de chaque objet comme dans list screen

      String currency = Medicament.fromMap(meds[i]).nom_med;
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownitems.add(newItem);
    }
    return dropdownitems;
  }

  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade400,
          title: Text(
              'Adoptation posologique'
          ),
        ),
        body:ListView(
          children: [
            Padding(
              padding:const EdgeInsets.only(top: 25.0,left: 25.0 ,right: 25.0),
              child: Text('choose the medication',style :
                TextStyle(
                  fontSize: size.width/23,
                  color: Colors.grey.shade800,
                ),),
            ),
            Padding(padding:const EdgeInsets.all(25.0),


                child:FutureBuilder(
                    future: dbmanager.getAllMed(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        meds = snapshot.data;
                        return DropdownButton<String>(
                            items: getDropDownItem(),
                            value: selected_item,
                            onChanged: (value)async {
                              setState(() {
                                selected_item = value;
                                print(' selected item $selected_item');
                              });
                              med_search =
                              await dbmanager.chercherMed(selected_item);

                              med_clr = await dbmanager.getClairance(med_search.id_med);
                              med_bil = await dbmanager.getBilirubine(med_search.id_med);
                              med_tgo = await dbmanager.getTgo_tgp(med_search.id_med);
                            });}})),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: clairance_cntrl,
                decoration: InputDecoration(
                  labelText: 'La clairance rénale',
//O

                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: bilurbine_cntrl,
                decoration: InputDecoration(
                  labelText: 'La bilirubine',


                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: tgo_cntrl,
                decoration: InputDecoration(
                  labelText: 'Tgo/Tgp',


                ),),
            ),
            RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
            color: Colors.amber.shade600,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
            child: Text(
            "Afficher résulta",
            style: TextStyle(
            color: Colors.white
            ,  fontSize: size.width/20,
            ),

            ),
            onPressed: ()async{
              String c=resultat_clairance(med_clr,clairance_cntrl.text);
              String b=resultat_bilirubine(med_bil,bilurbine_cntrl.text);
              String t=resultat_tgo(med_tgo,tgo_cntrl.text);

              Alert(
                context: context,
                content: Column(
                  children: [
                    SizedBox(
                      height: size.height/50,

                    ),
                    Text('Ce médicament est ',style: TextStyle(
                      fontSize: size.width/22,color: Colors.grey.shade800,
                    ),),
                    Text('- $c',style: TextStyle(
                      fontSize: size.width/22,
                    ),),
                    SizedBox(
                      height: size.height/50,
                    ),


                    Text('- $b',style:TextStyle(
                      fontSize: size.width/22,
                    ),),
                    SizedBox(
                      height: size.height/50,
                    ),

                    Text('- $t',style:TextStyle(
                      fontSize: size.width/22,
                    ),),
                  ],
                ),
                title: "Dose à administrer",

              )
                  .show();
            }),

          ],

        ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.tealAccent.shade400,
      style: TabStyle.react,
      items: [
        TabItem(icon: Icons.account_circle),
        TabItem(icon: Icons.add),
        TabItem(icon: Icons.list),
      ],
      initialActiveIndex: 0,
        onTap: (int i){
          if(i==0){
            Navigator.pushNamed(context, dose_screen.id);
          }else{
            if(i==1){
              Navigator.pushNamed(context, Add_med_screen.id);
            }
            else{
              Navigator.pushNamed(context,list_med_screen.id);

            }
          }
        },
    ),
    );
  }
}
