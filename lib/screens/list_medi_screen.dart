import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  Widget build(BuildContext context) {
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