import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starlite_app/domain/entities/app_error.dart';
import 'package:starlite_app/logger.dart';

const _i = 'initialize_database';
const _h = 'sql_query_client';

abstract class LocalDataBaseClient {
  LocalDataBaseClient._();

  static late Database database;

  static Future<String> _getDBpath() async {
    String databasesPath = await getDatabasesPath();
    return '$databasesPath/demo.db';
  }

  static deleteDataBase() async {
    String path = await _getDBpath();
    await deleteDatabase(path);
  }

  static closeDataBase() async {
    if (database.isOpen) {
      database.close();
    }
  }

  static initializeDataBase() async {
    String path = await _getDBpath();
    database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table

      await db.execute('CREATE TABLE Customer (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, contactnumber TEXT NOT NULL, location TEXT)');
      await db.execute('CREATE TABLE Product (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT,stock INTEGER, price INTEGER)');
      await db.execute('CREATE TABLE Purchaseorder (id INTEGER PRIMARY KEY AUTOINCREMENT, customerid INTEGER, productid INTEGER, quantity INTEGER, orderdatetime DATETIME)');
    }).onError((error, stackTrace) {
      logError(_i, 'Database Initialization Error : ${error.toString()}');
      throw DatabaseException;
    }).timeout(const Duration(seconds: 8), onTimeout: () {
      logError(_i, 'Database Initialization Error : Timeout');
      throw TimeoutException('Query time exceeded 8 Seconds.');
    }).whenComplete(() {
      logSuccess(_i, 'Database initialized successfully');
    });
  }

  static Future<List<Map>> getQuery({required String query}) async {
    try {
      List<Map> response = await database.rawQuery(query);
      logInfo(_h, 'Get Query Response : ${response.toString()}');
      return response;
    } catch (e) {
      logError(_h, 'Get Query Error : ${e.toString()}');
      throw Exception(e.toString());
    }
  }

  static Future<bool> postQuery({required String query}) async {
    // var response = await database.rawQuery(query);
    int responseId = 0;
    bool queryStatus = false;
    await database.transaction((txn) async {
      responseId = await txn.rawInsert(
        query,
      );
      if (responseId == 0) {
        /// return error
        logError(_h, 'Post Query Error : Post response $responseId');
        queryStatus = false;
        throw Exception('Insert Failed!');
        return left(const AppError(AppErrorType.database, error: 'Insert Failed!'));
      } else {
        logInfo(_h, 'Post Query Response : ${responseId.toString()}');
        queryStatus = true;
      }
    }).onError((error, stackTrace) {
      logError(_h, 'Post Query Error : ${error.toString()}');
      queryStatus = false;
      throw Exception(error.toString());
      return left(AppError(AppErrorType.database, error: error.toString()));
    });
    return queryStatus;
  }
}
