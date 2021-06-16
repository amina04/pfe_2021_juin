import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'model_bilirubine.dart';
import 'model_clairance.dart';
import 'model_medicament.dart';
import 'model_tgo_tgp.dart';
class Dbpfe {
  //cree une instance
  static final Dbpfe _instance = new Dbpfe.internal();

  factory Dbpfe() => _instance;
  static Database _db;
//la declaration des attributs des tableaux pour eviter de tamber en erreur d'ortographe
//tableau medicament=============================================
  final String tableMed = 'tableMedicament';
  final String columnId_med = 'id_med';
  final String columnNom = 'nom_med';

//tableau bilirubine=============================================
  final String tableBili = 'tableBilirubine ';
  final String columnId_Bil = 'id_bil';
  final String columninf_60 = 'inf_60';
  final String columnsup_60 = 'sup_60';

//tableau clairance=============================================
  final String tableclr = 'tableClairance';
  final String columnId_clr = 'id_clr';
  final String columninf_30 = 'inf_30';
  final String columnsup_60_clr = 'sup_60';
  final String columnentre_30_60 = 'entre_30_60';
//tableau tgo_tgp=============================================
  final String tableTgoTgp = 'tableTgo_tgp';
  final String columnId_tgo = 'id_tgo';
  final String columninf_55 = 'inf_55';
  final String columnsup_55 = 'sup_55';
//clé etranger =========================
  final String FKmedId = 'fk_med_id';
  //fonction qui cree une db
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Dbpfe.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(
        documentDirectory.path, "maindb.db"); //home://directory/files/maindb.db
    var ourdb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourdb;
  }

  void _onCreate(Database db, int version) async {
    debugPrint('Database OnCreate');
    //table medicament
    await db.execute(
      "CREATE TABLE $tableMed($columnId_med INTEGER PRIMARY KEY , $columnNom TEXT )",
    );
    debugPrint('table  medicament OnCreate');

    //table details clairance
    await db.execute(
      "CREATE TABLE $tableclr($columnId_clr INTEGER PRIMARY KEY,$columninf_30 TEXT,$columnsup_60_clr TEXT,$columnentre_30_60 TEXT,$FKmedId INTEGER, FOREIGN KEY($FKmedId ) REFERENCES $tableMed($columnId_med) ON DELETE CASCADE)",
    );
    //table details bilirubine
    await db.execute(
      "CREATE TABLE $tableBili($columnId_Bil INTEGER PRIMARY KEY,$columninf_60 TEXT,$columnsup_60 TEXT,$FKmedId INTEGER, FOREIGN KEY($FKmedId ) REFERENCES $tableMed($columnId_med) ON DELETE CASCADE)",
    );
    //table details tgo_tgp
    await db.execute(
      "CREATE TABLE $tableTgoTgp($columnId_tgo INTEGER PRIMARY KEY,$columninf_55 TEXT,$columnsup_55 TEXT,$FKmedId INTEGER, FOREIGN KEY($FKmedId ) REFERENCES $tableMed($columnId_med) ON DELETE CASCADE)",
    );
}
  //==============================CRUD MEDICAMENT1 ================================================================
//insirer fonction
  Future<int> insertMedicament(Medicament med) async {
    var dbMedicament = await db;
    int res = await dbMedicament.insert("$tableMed", med.toMap());

    return res;
  }

  //aficher tout les medicaments
  Future<List> getAllMed() async {
    var dbMedicament = await db;
    var result = await dbMedicament.rawQuery("SELECT * FROM $tableMed");
    return result.toList();
  }

  //afficher un medicament
  Future<Medicament> getMed(int id) async {
    var dbMedicament = await db;
    var result = await dbMedicament
        .rawQuery("SELECT * FROM $tableMed WHERE $columnId_med =$id");
    if (result.length == 0) return null;
    return new Medicament.fromMap(result.first);
  }

  //chercher un medicament
  Future<Medicament> chercherMed(String nom) async {
    var dbMedicament = await db;
    var result = await dbMedicament
        .rawQuery("SELECT * FROM $tableMed WHERE $columnNom LIKE '$nom%' ");
    if (result.length == 0) return null;
    return new Medicament.fromMap(result.first);
  }

  //==============================CRUD Billurbine ================================================================
//insirer fonction
  Future<int> insertBilirubine(Bilirubine bil) async {
    var dbBilirubine = await db;
    int res = await dbBilirubine.insert("$tableBili", bil.toMap());

    return res;
  }

  //aficher tout les medicaments
  Future<List> getAllBilirubine() async {
    var dbBilirubine = await db;
    var result = await dbBilirubine.rawQuery("SELECT * FROM $tableBili");
    return result.toList();
  }

  //afficher un medicament
  Future<Bilirubine> getBilirubine(int id) async {
    var dbBilirubine = await db;
    var result = await dbBilirubine
        .rawQuery("SELECT * FROM $tableBili WHERE $FKmedId =$id");
    if (result.length == 0) return null;
    return new Bilirubine.fromMap(result.first);
  }
  //==============================CRUD clairance ================================================================
//insirer fonction
  Future<int> insertClairance(Clairance clr) async {
    var dbClairance = await db;
    int res = await dbClairance.insert("$tableclr", clr.toMap());

    return res;
  }

  //aficher tout les medicaments
  Future<List> getAllClairance() async {
    var dbClairance = await db;
    var result = await dbClairance.rawQuery("SELECT * FROM $tableclr");
    return result.toList();
  }

  //afficher un medicament
  Future<Clairance> getClairance(int id) async {
    var dbClairance = await db;
    var result = await dbClairance
        .rawQuery("SELECT * FROM $tableclr WHERE $FKmedId =$id");
    if (result.length == 0) return null;
    return new Clairance.fromMap(result.first);
  }
  //==============================CRUD tgo_tgp ================================================================
//insirer fonction
  Future<int> insertTgo_tgpe(Tgo_tgp tgo) async {
    var dbTgo_tgp = await db;
    int res = await dbTgo_tgp.insert("$tableTgoTgp", tgo.toMap());

    return res;
  }

  //aficher tout les medicaments
  Future<List> getAllTgo_tgp() async {
    var dbTgo_tgp = await db;
    var result = await dbTgo_tgp.rawQuery("SELECT * FROM $tableTgoTgp");
    return result.toList();
  }

  //afficher un medicament
  Future<Tgo_tgp> getTgo_tgp(int id) async {
    var dbTgo_tgp = await db;
    var result = await dbTgo_tgp
        .rawQuery("SELECT * FROM $tableTgoTgp WHERE $FKmedId =$id");
    if (result.length == 0) return null;
    return new Tgo_tgp.fromMap(result.first);
  }

  }

