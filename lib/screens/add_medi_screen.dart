
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe_2021_juin/controller/add_med_controller.dart';

import 'package:pfe_2021_juin/model/database.dart';
import 'package:pfe_2021_juin/model/model_bilirubine.dart';
import 'package:pfe_2021_juin/model/model_clairance.dart';
import 'package:pfe_2021_juin/model/model_medicament.dart';
import 'package:pfe_2021_juin/model/model_tgo_tgp.dart';
import 'package:pfe_2021_juin/screens/dose_screen.dart';
import 'package:pfe_2021_juin/screens/list_medi_screen.dart';
class Add_med_screen extends StatelessWidget {
  static String id = 'add_med_screen';
  var dbmanager = new Dbpfe();
  @override
  Widget build(BuildContext context) {
    //bah najabdo size ta3 tel w n3adlo l7ala 3la 7ssabo
    Size size=MediaQuery.of(context).size;
    //heda darto bah nasta3ml insertion a3 medicament khatra wahda ama details ra7 ykon 3la kol naw3
    bool insert_before=false;
    //bah ki n3ayto fonction insirer rayha taglbbna id ta3 med hada mb3d hada id nasta3mlo ndakhloh 3la
    //asas clé étranger f ba9i les tables
    int id_med;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade400,
        title: Text(
            'Ajouter un médicament'
        ),
      ),
      //liste view bah screen na9adro nhabto fiha
      body:Column(

        children: [
          //bah ykon faragh
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              //controller bah nhazo wach aw maktob f text field
              controller: nom_med_ctrl,
              decoration: InputDecoration(
                labelText: 'nom de médicament',


              ),

            ),
          ),
          SizedBox(
            height: size.height/30,
          ),
          Expanded(
            child: Container(

              child: ListView(

                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                   width: size.width-80,


                    child:    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        children: [
                          Center(
                            child: Text('La clairance rénale',style: TextStyle(
                              fontSize: size.width/21,

                            ),),
                          ),
                          SizedBox(
                            height: size.height/35,
                          ),
                          Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade200,

                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                              child: Column(

                                children: [
                                  TextField(
                                    controller:clr_inf30_ctrl,
                                    decoration: InputDecoration(
                                      labelText: '<= 30 ml/min',


                                    ),),
                                  TextField(
                                    controller:clr_sup60_ctrl,
                                    decoration: InputDecoration(
                                      labelText: '>= 60 ml/min',


                                    ),),
                                  TextField(
                                    controller:clr_entre_30_60_ctrl,
                                    decoration: InputDecoration(
                                      labelText: 'entre 30 ml/min et 60 ml/min',


                                    ),),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: size.height/20,
                          ),
                          //  FloatingActionButton(

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           FloatingActionButton(
                                onPressed: (){
                                  clr_inf30_ctrl.clear();
                                  clr_sup60_ctrl.clear();
                                  clr_entre_30_60_ctrl.clear();
                                },
                                child: new Icon(
                                  Icons.backspace_outlined,
                                  size: 30,
                                ),
                                backgroundColor: Colors.amber.shade600,
                                foregroundColor: Colors.white,
                              ),
                              SizedBox(
                                width: size.width/25,
                              ),
                              FloatingActionButton(
                                onPressed: ()async{

                                  //je fais ce texte pour insire le nom de med 1 seule fois car ici je fais pls buton pour

                                  if(insert_before==false){
                                    // medicament le nom n'est pas  insiréé
                                    id_med = await dbmanager.insertMedicament(new Medicament(
                                      nom_med_ctrl.text,
                                    ));
                                    print("id medicament $id_med");
                                    insert_before =true;
                                  }
                                  //insirérer clairance
                                  int id_clr=  await dbmanager.insertClairance(new Clairance(
                                      clr_inf30_ctrl.text,clr_sup60_ctrl.text,clr_entre_30_60_ctrl.text,id_med
                                  ));

                                },
                                child: new Icon(
                                  Icons.check,
                                  size: 30,
                                ),
                                backgroundColor: Colors.amber.shade600,
                                foregroundColor: Colors.white,
                              ),
                            ],
                          ),
                        ],

                      ),
                    ),
                  ),
                  Container(
                    width: size.width-80,


                    child:    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        children: [
                          Center(
                            child: Text('La bilirubine',style: TextStyle(
                              fontSize: size.width/21,

                            ),),
                          ),
                          SizedBox(
                            height: size.height/35,
                          ),
                          Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade200,

                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 10.0),
                              child: Column(

                                children: [
                                  TextField(
                                    controller:bil_inf60_ctrl,
                                    decoration: InputDecoration(
                                      labelText: '< 60 ml/min',


                                    ),),
                                  TextField(
                                    controller:bil_sup60_ctrl,
                                    decoration: InputDecoration(
                                      labelText: '>= 60 ml/min',


                                    ),),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: size.height/20,
                          ),
                          //  FloatingActionButton(

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  bil_inf60_ctrl.clear();
                                  bil_sup60_ctrl.clear();
                                },
                                child: new Icon(
                                  Icons.backspace_outlined,
                                  size: 30,
                                ),
                                backgroundColor: Colors.amber.shade600,
                                foregroundColor: Colors.white,
                              ),
                              SizedBox(
                                width: size.width/25,
                              ),
                              FloatingActionButton(
                                onPressed: ()async{
                                  if(insert_before==false){
                                    // medicament le nom n'est pas  insiréé
                                    id_med = await dbmanager.insertMedicament(new Medicament(
                                      nom_med_ctrl.text,
                                    ));

                                    insert_before =true;
                                  }


                                  int id_bil=  await dbmanager.insertBilirubine(new Bilirubine(
                                      bil_inf60_ctrl.text,bil_sup60_ctrl.text,id_med
                                  ));

                                },
                                child: new Icon(
                                  Icons.check,
                                  size: 30,
                                ),
                                backgroundColor: Colors.amber.shade600,
                                foregroundColor: Colors.white,
                              ),
                            ],
                          ),
                        ],

                      ),
                    ),
                  ),

                  Container(
                    width: size.width-80,


                    child:    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        children: [
                          Center(
                            child: Text('Tgo/Tgp',style: TextStyle(
                              fontSize: size.width/21,

                            ),),
                          ),
                          SizedBox(
                            height: size.height/35,
                          ),
                          Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade200,

                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 10.0),
                              child: Column(

                                children: [
                                  TextField(
                                    controller:tgo_inf55_ctrl,
                                    decoration: InputDecoration(
                                      labelText: '< 55 ml/min',


                                    ),),
                                  TextField(
                                    controller:tgo_sup55_ctrl,
                                    decoration: InputDecoration(
                                      labelText: '>= 55 ml/min',


                                    ),),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: size.height/20,
                          ),
                          //  FloatingActionButton(

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  tgo_inf55_ctrl.clear();
                                  tgo_sup55_ctrl.clear();
                                },
                                child: new Icon(
                                  Icons.backspace_outlined,
                                  size: 30,
                                ),
                                backgroundColor: Colors.amber.shade600,
                                foregroundColor: Colors.white,
                              ),
                              SizedBox(
                                width: size.width/25,
                              ),
                              FloatingActionButton(
                                onPressed: ()async{
                                  if(insert_before==false){
                                    // medicament le nom n'est pas  insiréé
                                    id_med = await dbmanager.insertMedicament(new Medicament(

                                      nom_med_ctrl.text,
                                    ));

                                    insert_before =true;
                                  }
                                  int id_tg = await dbmanager.insertTgo_tgpe(new Tgo_tgp(
                                      tgo_inf55_ctrl.text,tgo_sup55_ctrl.text,id_med
                                  ));


                                },
                                child: new Icon(
                                  Icons.check,
                                  size: 30,
                                ),
                                backgroundColor: Colors.amber.shade600,
                                foregroundColor: Colors.white,
                              ),
                            ],
                          ),
                        ],

                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
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
        initialActiveIndex: 1,
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


