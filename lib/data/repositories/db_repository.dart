

import 'package:dartz/dartz.dart';
import 'package:starlite_app/core/local_db_client.dart';


class DataBaseRepository{
  DataBaseRepository._();

  static initializeDatabase() async{
    await LocalDataBaseClient.initializeDataBase();
    return true;
  }

}