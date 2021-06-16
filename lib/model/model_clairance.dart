class Clairance{
  //les colones de table calcul

  int _id_clr;

  String _inf_30;
  String _sup_60;
  String _entre_30_60;
  int _fk_med_id;
  //un constructeur pour remplir le table
  Clairance(


      this._inf_30,
      this._sup_60,
      this._entre_30_60,
      this._fk_med_id,
      );
  Clairance.map(dynamic obj) {
    this._id_clr = obj['id_clr'];
    this._inf_30 = obj['inf_30'];
    this._sup_60 = obj['sup_60'];
    this._entre_30_60 = obj['entre_30_60'];
    this._fk_med_id = obj['fk_med_id'];


  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  int get id_clr => _id_clr;
  String get inf_30 => _inf_30;
String get sup_60 => _sup_60;
String get entre_30_60 => _entre_30_60;
int get fk_med_id => _fk_med_id;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id_clr'] = _id_clr;
    map['inf_30'] = _inf_30;
    map['sup_60'] = _sup_60;
    map['entre_30_60'] = _entre_30_60;
    map['fk_med_id'] = _fk_med_id;

    return map;
  }

  Clairance.fromMap(Map<String, dynamic> map) {
    this._id_clr = map['id_clr'];
    this._inf_30 = map['inf_30'];
    this._sup_60 = map['sup_60'];
    this._entre_30_60 = map['entre_30_60'];
    this._fk_med_id = map['fk_med_id'];


  }
}
