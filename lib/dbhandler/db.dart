import 'dart:io';
import 'dart:typed_data';

import 'package:db_one/models/model.dart';
import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';  //getApllicatonDirectory mate
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart'; //join use karva mate



class DBHelper
{
    static const String table ='User';
    static const String dbname = 'usermod.db';
    static const String colId = 'id';
    static const String colName = 'name';
    static const String colEmail = 'email';
    static const String colMob = 'mob';
    static const String colPass = 'pass';

    DBHelper._privateConstructor();
    static final DBHelper instance = DBHelper._privateConstructor();

    static Database? _db;    //single database

    Future<Database?> get db async
    {
      if(_db != null)
        {
          return _db;
        }
      _db = await initDatabase();
      return _db;
    }
    initDatabase() async
    {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath,dbname);

      var exists = await databaseExists(path);
      if(!exists)
      {
        // if (kDebugMode) {
        print('copy database start');
        // }
        try{
          await Directory(dirname(path)).create(recursive: true);
        }catch(_){
        }
        //copy
        ByteData data = await rootBundle.load(join("assets",dbname));
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
        await File(path).writeAsBytes(bytes,flush: true);
      }else{
        // if (kDebugMode) {
        print('opening existing database');
        // }
      }
      return await openDatabase(path,version: 1);
    }
    //insert
    Future<int?> insertData (Map<String,dynamic>row) async
    {
      Database? dbs = await instance.db;
      return await dbs?.insert(table, row);
    }
    //select all
    Future<List?> getAllContacts() async
    {
      Database? dbs = await instance.db;
      var result = await dbs?.query(table);
      return result?.toList();
    }
    //all data show
    // Future<List<Map<String,dynamic?>>?> listData()async
    // {
    //   var dbClient = await db;
    //   var res = await dbClient?.query(table,columns: [colId,colName,colEmail,colMob]);
    //   return res?.toList();
    //     // final List<Map<String,dynamic> users = await dbClient?.query(table);
    //     // List.generate
    //       // List<Map<String, dynamic>>? maps = await dbClient?.query(table,columns: [colId,colName,colEmail,colMob]);
    //       // List<UserModel> users = [];
    //       //
    //       // if(maps.length ?? > 0)
    //       //   {
    //       //     for(int i=0;i<maps?.length;i++)
    //       //       {
    //       //         users.add(UserModel.fromMap(maps[i]));
    //       //       }
    //       //   }
    //       // return users;
    //
    // }
    //raw query
    Future<int?> getCount() async
    {
      var dbs = await instance.db;
      // return Sqflite.firstIntValue(await dbs?.rawQuery('SELECT COUNT(EMAIL) FROM $table''));
      final result = await dbs?.rawQuery('SELECT COUNT(id) FROM $table');
      final count = Sqflite.firstIntValue(result!);
      return count;
    }
    //rawquery
    // Future<int?> getCount() async
    // {
    //   var dbClient = await db;
    //   final res = await dbClient?.rawQuery('SELECT COUNT * FROM $table');
    //   final count = Sqflite.firstIntValue(res!);
    //   return count ;
    //   // List<Map<String,Object>> x = await dbClient?.rawQuery(sql);
    // }
    //delete
    //update
    Future<int?> updateData(Map<String,dynamic>row) async
    {
      Database? dbs = await instance.db;
      String id = row[colId];
      return await dbs?.update(table, row,where: '$colId = ?',whereArgs: [id]);
    }

    //delete
    Future<int?> deleteData(String id) async
    {
      Database? dbs = await instance.db;
      return await dbs?.delete(table,where: '$colId = ?',whereArgs: [id]);
    }
}
