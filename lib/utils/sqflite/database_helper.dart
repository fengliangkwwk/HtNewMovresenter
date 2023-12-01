// import 'dart:io';

// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:ht_new_movpresenter/ht_home_page/ht_video_paly/bean/ht_video_desc_bean.dart';

// class DatabaseHelper {
//   DatabaseHelper._(); //单例模式

//   static final DatabaseHelper db = DatabaseHelper._();
//   static Database? _database;

//   Future<Database?> get database async {
//     _database ??= await initDb();
//     return _database;
//   }

//   //init database and open it
//   Future<Database> initDb() async {
//     print("initDb");
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, 'yytimer.db');
//     print("initDb ${path}");

//     Database db = await openDatabase(path, version: 1, onOpen: (db) async {
//       // 等待表创建完成
//       await db.execute(
//           'CREATE TABLE IF NOT EXISTS timerdata (id INTEGER PRIMARY KEY, title TEXT, sptime INTEGER, retime INTEGER, cycle INTEGER, setsgap INTEGER, groups INTEGER)');
//     });
//     return db;
//   }

//   //insert database
//   Future<int?> insert(Data data) async {
//     print('insert data Saving Task...');
//     final db = await database; // 确保database在上下文中定义

//     try {
//       var result = await db?.rawInsert(
//           'INSERT OR REPLACE INTO timerdata (id,title,sptime,retime, cycle,setsgap,groups) VALUES (?,?,?,?,?,?,?)',
//           [
//             data.id, //电影 id/电视剧 id
//             data.title, //名字
//             data.cover, //封面
//             data.rate, //评分
//             data.pubDate, //上映时间
//             data.mType2, //mflx代表电影，tt_mflx代表电视剧；
//             data.playLock // 1锁电影，0不锁
//           ]);
//       print(
//           'insert data id timerdata saved! ${data.id}, ${data.title}, ${data.cover}, ${data.rate},${data.pubDate}, ${data.mType2}, ${data.playLock}');
//       return result;
//     } on DatabaseException catch (e) {
//       print(e);
//       return -1;
//     }
//   }

//   //query database
//   Future<List> getAll() async {
//     print('getAll database...');
//     var db = await database;
//     var query = await db?.query('timerdata', orderBy: 'id DESC');

//     List list =
//         query!.isNotEmpty ? query.map((t) => Data.fromMap(t)).toList() : [];
//     print(
//         'getAll in database: ${list.length} , ${list[0].title},${list[1].title}');
//     return list;
//   }

//   //delete sql by id
//   Future<void> delete(int id) async {
//     var db = await database;
//     await db?.rawDelete('DELETE FROM timerdata WHERE id = ?', [id]);
//   }

//   //delete sql by title
//   Future<void> deleteByTitle(String title) async {
//     var db = await database;
//     await db?.rawDelete('DELETE FROM timerdata WHERE title = ?', [title]);
//   }

//   //update database by id
//   Future<void> updateDatabase(Data task) async {
//     final db = await database;
//     await db?.update(
//       'timerdata',
//       // task.toMap(),
//       where: "id = ?",
//       whereArgs: [task.id],
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   //update database by title
//   Future<void> updateDatabaseByTitle(Data data) async {
//     final db = await database;
//     await db?.update(
//       'timerdata',
//       where: "title = ?",
//       whereArgs: [data.title],
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
// }
