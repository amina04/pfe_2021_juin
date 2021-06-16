import 'package:pfe_2021_juin/model/model_bilirubine.dart';
import 'package:pfe_2021_juin/model/model_clairance.dart';
import 'package:pfe_2021_juin/model/model_tgo_tgp.dart';

// les fonctions pour remplir les détails de la recherche
String remplir_clr_inf(Clairance c){
  String res;
  if(c == null){
    print('vide');
   res =' ';

  }else{
    res= c.inf_30;

  }
  return res;
}
String remplir_clr_sup(Clairance c){
  String res;
  if(c == null){

    res=' ';

  }else{

    res=c.sup_60;

  }
  return res;
}
String remplir_clr_entre(Clairance c){
  String res;
  if(c == null){
    print('vide');

   res= ' ';
  }else{

    res = c.entre_30_60;
  }
  return res;
}
String remplir_bil_inf(Bilirubine b,) {
  String res;
  if (b == null) {
    res = ' ';
  } else {
    res =  b.inf_60;
  }
  return res;
}
String remplir_bil_sup(Bilirubine b,){
  String res;
  if(b == null){

    res =' ';

  }else{

    res =b.sup_60;
  }
  return res;
}
String remplir_tgo_inf(Tgo_tgp t){String res;
if(t == null){
  res =' ';


}else{
  res =t.inf_55;


}
return res;}
String remplir_tgo_sup(Tgo_tgp t){String res;
if(t == null){

 res= ' ';

}else{
  res = t.sup_55;

}
return res ;}
//fonction de résultat

String resultat_clairance(Clairance c,String text){
  String res;
  double val =double.parse(text);
  if(c==null){
    res='ce médicament ne besoin pas ce bilan';
  }else{
    if(val<=30){
      res=c.inf_30;
    }else{if(val >=60){
      res =c.sup_60;
    }else{
      res=c.entre_30_60;
    }
    }
  }

  return res;
}

String resultat_bilirubine(Bilirubine b,String text){
  String res;
  double val =double.parse(text);
  if(b==null){
    res='ce médicament ne besoin pas ce bilan';
  }else{
    if(val<60) {
      res = b.inf_60;
    }else {
      res = b.sup_60;
    }
  }

  return res;

}

String resultat_tgo(Tgo_tgp t,String text){
  String res;
  double val =double.parse(text);
  if(t == null){
    res='ce médicament ne besoin pas ce bilan';
  }else{
    if(val<55) {
      res = t.inf_55;
    }else {
      res = t.sup_55;
    }
  }

  return res;

}