import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe_2021_juin/controller/functions.dart';

import 'package:pfe_2021_juin/model/database.dart';
import 'package:pfe_2021_juin/model/model_medicament.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:pfe_2021_juin/screens/dose_screen.dart';
import 'package:pfe_2021_juin/screens/add_medi_screen.dart';

import '../main.dart';

class list_med_screen extends StatefulWidget {
  static String id = 'list_med_screen';

  @override
  _list_med_screenState createState() => _list_med_screenState();
}

class _list_med_screenState extends State<list_med_screen> {
  var dbmanager = new Dbpfe();
  final chercher_med_ctrl = TextEditingController();
  @override
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text(
    'Liste des médicaments',

  );
  String clr_inf =remplir_clr_inf(med_clr);
  String clr_sup =remplir_clr_sup(med_clr);
  String clr_entre =remplir_clr_entre(med_clr);
  String bil_inf =remplir_bil_inf(med_bil);
  String bil_sup =remplir_bil_sup(med_bil);
  String tgo_inf =remplir_tgo_inf(med_tgo);
  String tgo_sup =remplir_tgo_sup(med_tgo);
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    controller: chercher_med_ctrl,
                    decoration:
                    InputDecoration(hintText: 'Chercher un médicament'),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (term) async {
                      //si le med n existe pas on affiche ce alert message
                      med_search =
                      await dbmanager.chercherMed(chercher_med_ctrl.text);

                      if (med_search == null) {
                        Alert(
                            context: context,
                            title: "Ce médicament n'existe pas",
                            desc: "vous devez le l'ajouter d'abord.")
                            .show();
                      } else {
                        selected_id = med_search.id_med;
                        print('id delectionne $selected_id');

                        med_clr = await dbmanager.getClairance(selected_id);
                        med_bil = await dbmanager.getBilirubine(selected_id);
                        med_tgo = await dbmanager.getTgo_tgp(selected_id);
                        //=========================
                        med_search=null;
                        print('exisit');
                        Alert(
                          context: context,
                          content: Column(
                            children: [
                              Text('La clairance rénale',textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.width/20,

                                ),),
                              SizedBox(
                                height: size.height/31,
                              ),
                              Text('Si elle est <= 30 ml/min : ',style: TextStyle(
                                  fontSize: size.width/25,
                                  fontWeight: FontWeight.bold
                              ),),

                              Text(' $clr_inf',style: TextStyle(
                                fontSize: size.width/25,

                              ),),
                              SizedBox(
                                height: size.height/54,
                              ),
                              Text('Si elle est >= 60 ml/min : ',style: TextStyle(
                                  fontSize: size.width/25,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text(' $clr_sup',style: TextStyle(
                                fontSize: size.width/25,

                              ),),
                              SizedBox(
                                height: size.height/54,
                              ),
                              Text('Si elle est entre 30 et 60 ml/min : ',style: TextStyle(
                                  fontSize: size.width/25,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text(' $clr_entre',style: TextStyle(
                                fontSize: size.width/25,

                              ),),
                              SizedBox(
                                height: size.height/31,
                              ),
                              Text('La bilirubine ',textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.width/20,

                                ),),
                              SizedBox(
                                height: size.height/31,
                              ),
                              Text('Si elle est < 60 : ',style: TextStyle(
                                  fontSize: size.width/25,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text(' $bil_inf',style: TextStyle(
                                fontSize: size.width/25,

                              ),),
                              SizedBox(
                                height: size.height/31,
                              ),
                              Text('Si elle est >= 60 :',style: TextStyle(
                                  fontSize: size.width/25,
                                  fontWeight: FontWeight.bold
                              ),),

                              Text(' $bil_sup',style: TextStyle(
                                fontSize: size.width/25,

                              ),),
                              SizedBox(
                                height: size.height/31,
                              ),
                              Text('Tgo/Tgp',textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.width/20,

                                ),),
                              SizedBox(
                                height: size.height/31,
                              ),
                              Text('Si il est < 55 :',style: TextStyle(
                                  fontSize: size.width/25,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text(' $tgo_inf',style: TextStyle(
                                fontSize: size.width/25,

                              ),),
                              SizedBox(
                                height: size.height/31,
                              ),
                              Text('Si il est >= 55 : ',style: TextStyle(
                                  fontSize: size.width/25,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text(' $tgo_sup',style: TextStyle(
                                fontSize: size.width/25,

                              ),),

                            ],
                          ),
                          title: "Dose à administrer",

                        )
                            .show();
                     /*   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>Searching_details()));*/
                      }
                   },
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text(
                    'Liste des médicaments',

                  );
                }
              });
            },
            icon: cusIcon,
          ),
        ],
        centerTitle: true,
        title: cusSearchBar,

      ),
      //pour reecrier la list view aprées chaque ajout

      body: FutureBuilder(
        future: dbmanager.getAllMed(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            meds = snapshot.data;
            return _buildlistview();
          }
          return new CircularProgressIndicator();
        },
      ),
      bottomNavigationBar: ConvexAppBar(

        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.account_circle),
          TabItem(icon: Icons.add),
          TabItem(icon: Icons.list),
        ],
        initialActiveIndex: 2,
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
//la methode buildlist view
ListView _buildlistview() {
  return ListView.builder(
      itemCount: meds == null ? 0 : meds.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          child: ListTile(
            title: Text(
              'médicament : ${Medicament.fromMap(meds[position]).nom_med}',

            ),



          ),
        );
      });
}