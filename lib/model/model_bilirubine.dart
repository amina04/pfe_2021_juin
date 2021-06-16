class Bilirubine{
  //les colones de table calcul
//mx
  int _id_bil;

  String _inf_60;
  String _sup_60;

  int _fk_med_id;
  //un constructeur pour remplir le table
  Bilirubine(

      this._inf_60,
      this._sup_60,

      this._fk_med_id,
      );
  Bilirubine.map(dynamic obj) {
    this._id_bil = obj['id_bil'];
    this._inf_60 = obj['inf_60'];
    this._sup_60 = obj['sup_60'];

    this._fk_med_id = obj['fk_med_id'];


  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  int get id_bil => _id_bil;
  String get inf_60 => _inf_60;
  String get sup_60 => _sup_60;

  int get fk_med_id => _fk_med_id;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id_bil'] = _id_bil;
    map['inf_60'] = _inf_60;
    map['sup_60'] = _sup_60;

    map['fk_med_id'] = _fk_med_id;

    return map;
  }

  Bilirubine.fromMap(Map<String, dynamic> map) {
    this._id_bil = map['id_bil'];
    this._inf_60 = map['inf_60'];
    this._sup_60 = map['sup_60'];

    this._fk_med_id = map['fk_med_id'];


  }
}
