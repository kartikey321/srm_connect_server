import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';

import 'package:shelf_plus/shelf_plus.dart';
import 'package:srm_connect_server/helpers/mongo_helper.dart';
import 'package:srm_connect_server/model/parent.dart';

Db? mongoDb;
MongoHelper mongoHelper = MongoHelper();
void main() async {
  mongoDb = await mongoHelper.initiaize();
  shelfRun(() => init());
}

Handler init() {
  var app = Router().plus;

  app.get('/greet', (Request request) => 'Hi to all');

  app.get('/student/<id>', (Request request, String id) async {
    var data = await mongoHelper.getStudentbyId(id);
    return data;
  });

  app.get('/parent/<id>', (Request request, String id) async {
    var data = await mongoHelper.getParentbyId(id);
    return data;
  });

  app.post('/parent/add', (Request request) async {
    print(request.body);
    var text = await request.body.asString;
    var data = jsonDecode(text);
    print(data);
    Parent parent = Parent.fromMap(data);
    print(parent);
    var resp = await mongoHelper.addParent(parent);
    return resp;
  });

  return app;
}
