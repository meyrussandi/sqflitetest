import 'package:sqflite/sqflite.dart';
import 'package:sqflitetest/models/user_model.dart';
import 'package:path/path.dart';


class MyDatabase{
  static final MyDatabase instance = MyDatabase._init();

  static Database? _database;

  MyDatabase._init();

  Future<Database> get database async{
    if(_database != null) return _database!;

    _database = await _initDb('nasha_database.db');
    return _database!;
  }

  Future<Database> _initDb(String filePath)async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version)async{
    await db.execute('''
    CREATE TABLE users (
    _id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    phone TEXT NOT NULL,
    city TEXT NOT NULL,
    loginAt TEXT NOT NULL
    )
    ''');
  }

  Future close()async{
    final db = await instance.database;

    db.close();
  }

  Future<UserModel> createUser(UserModel userModel)async{
    final db = await instance.database;

    final id = await db.insert('users', userModel.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return userModel.copy(id:id);
  }

  Future<UserModel> readUser(int id)async{
    final db = await instance.database;

    final maps = await db.query('users',
    columns: ['name', 'email', 'password'],
    where: '_id = ?',
    whereArgs: [id]);

    if(maps.isNotEmpty){
      return UserModel.fromJson(maps.first);
    }else{
      throw Exception('ID $id not found');
    }
  }

  Future<UserModel> loginUser(String email, String password)async{
    final db = await instance.database;

    final maps = await db.query('users',
        columns: ['_id','name', 'email', 'password', 'phone', 'city', 'loginAt'],
        where: 'email = ? AND password = ?',
        whereArgs: [email, password]);

    if(maps.isNotEmpty){
      return UserModel.fromJson(maps.first);
    }else{
      throw 'User not found';
    }
  }

  Future<List<UserModel>> readAllUser()async{
    final db = await instance.database;

    final result = await db.query('users', orderBy: 'name ASC');

    return result.map((json) => UserModel.fromJson(json)).toList();
  }

  Future<int> updateUser(UserModel userModel)async{
    final db= await instance.database;
    
    return db.update('users', userModel.toMap(),
    where: '_id = ?',
      whereArgs: [userModel.id]
    );
  }

  Future<int> deleteUser(int id)async{
    final db = await instance.database;

    return db.delete('users', where: '_id = ?',
        whereArgs: [id]);
  }

}