import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:srm_connect_server/model/student.dart';

import '../model/course.dart';
import '../model/parent.dart';

class MongoHelper {
  mongo.Db? db;

  Future<mongo.Db> initiaize() async {
    db = await mongo.Db.create(
        "mongodb+srv://kartikey321:kartikey321@cluster0.ykqbrjy.mongodb.net/");
    await db!.open().whenComplete(() {
      print(db);
    });
    print(db);
    return db!;
  }

  Future<void> clearAllCollections() async {
    // Open the database connection if not already opened

    var collections = await db!.getCollectionNames();
    for (var collectionName in collections) {
      var collection = db!.collection(collectionName!);
      await collection.drop();
      print('Collection $collectionName cleared.');
    }
  }

  Future addParent(Parent parent) async {
    var parentsColl = db!.collection('parents');
    await parentsColl.createIndex(
      keys: {'email': 1},
      unique: true,
    );
    try {
      await parentsColl.insertOne(parent.toMap());
      print('Parent added!');
      return 'Success: Parent added';
    } catch (e) {
      // Handle other errors, if any
      print('Error: $e');
      return 'Error: $e';
    }
  }

  Future<void> addStudent(Student student) async {
    var studentsColl = db!.collection('students');
    await studentsColl.createIndex(
      keys: {'email': 1},
      unique: true,
    );
    try {
      await studentsColl.insertOne(student.toMap());
      print('Student added!');
    } catch (e) {
      // Handle other errors, if any
      print('Error: $e');
    }
  }

  Future<Student?> getStudentbyId(String id) async {
    var studentsColl = db!.collection('students');
    var data = await studentsColl.findOne(mongo.where.eq('regNum', id));
    if (data != null) {
      Student model = Student.fromMap(data);
      return model;
    }
  }

  Future<Parent?> getParentbyId(String email) async {
    var parentsColl = db!.collection('parents');
    var data = await parentsColl.findOne(mongo.where.eq('email', email));
    if (data != null) {
      Parent model = Parent.fromMap(data);
      return model;
    }
  }
}
