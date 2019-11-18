import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;
import 'dart:async';

class DBConnection {

  static DBConnection _instance;

  final String _host = "172.20.0.1";
  final String _port = "27017";
  final String _dbName = "test";
  Db _db;

  static getInstance(){
    if(_instance == null) {
      _instance = DBConnection();
    }
    return _instance;
  }

  Future<Db> getConnection() async{
    var test1;
    if (_db == null){
      try {
        _db = Db(_getConnectionString());
        await _db.open();
        DbCollection coll = _db.collection("test");
        test1 = await coll.find();
        // var coll = _db.collection("test");
        // test1 = await coll.find({}).toList();
      } catch(e){
        print(e);
      }
    }
    return test1;//_db;
  }

  _getConnectionString(){
    return "mongodb://$_host:$_port/$_dbName";
  }

  closeConnection() {
    _db.close();
  }

}