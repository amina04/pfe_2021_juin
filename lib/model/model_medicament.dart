class Medicament{
  //les colones de table calcul

  int _id_med;
  String _nom_med;

  //un constructeur pour remplir le table
  Medicament(
      this._nom_med,

      );
  Medicament.map(dynamic obj) {
    this._id_med = obj['id_med'];
    this._nom_med = obj['nom_med'];

  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  int get id_med => _id_med;
  String get nom_med => _nom_med;



  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id_med'] = _id_med;
    map['nom_med'] = _nom_med;


    return map;
  }

  Medicament.fromMap(Map<String, dynamic> map) {
    this._id_med = map['id_med'];
    this._nom_med = map['nom_med'];

  }
}
