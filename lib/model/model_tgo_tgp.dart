class Tgo_tgp{
  //les colones de table calcul

  int _id_tgo;

  String _inf_55;
  String _sup_55;

  int _fk_med_id;
  //un constructeur pour remplir le table
  Tgo_tgp(


      this._inf_55,
      this._sup_55,

      this._fk_med_id,
      );
  Tgo_tgp.map(dynamic obj) {
    this._id_tgo = obj['id_tgo'];
    this._inf_55 = obj['inf_55'];
    this._sup_55 = obj['sup_55'];

    this._fk_med_id = obj['fk_med_id'];


  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  int get id_tgo => _id_tgo;
  String get inf_55 => _inf_55;
  String get sup_55 => _sup_55;

  int get fk_med_id => _fk_med_id;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id_tgo'] = _id_tgo;
    map['inf_55'] = _inf_55;
    map['sup_55'] = _sup_55;

    map['fk_med_id'] = _fk_med_id;

    return map;
  }

  Tgo_tgp.fromMap(Map<String, dynamic> map) {
    this._id_tgo = map['id_tgo'];
    this._inf_55 = map['inf_55'];
    this._sup_55 = map['sup_55'];

    this._fk_med_id = map['fk_med_id'];


  }
}
