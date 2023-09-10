// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'academics.dart';
import 'course.dart';

class Student {
  String id;
  String regNum;
  String name;
  String email;
  String batch;
  String year;
  String facultyAdvisor;
  String department;
  String whatsappNumber;
  List<String> parentIds;
  List<Academics> academics;
  List<Course> courses;
  Student({
    required this.id,
    required this.regNum,
    required this.name,
    required this.email,
    required this.batch,
    required this.year,
    required this.facultyAdvisor,
    required this.department,
    required this.whatsappNumber,
    required this.parentIds,
    required this.academics,
    required this.courses,
  });

  Student copyWith({
    String? id,
    String? regNum,
    String? name,
    String? email,
    String? batch,
    String? year,
    String? facultyAdvisor,
    String? department,
    String? whatsappNumber,
    List<String>? parentIds,
    List<Academics>? academics,
    List<Course>? courses,
  }) {
    return Student(
      id: id ?? this.id,
      regNum: regNum ?? this.regNum,
      name: name ?? this.name,
      email: email ?? this.email,
      batch: batch ?? this.batch,
      year: year ?? this.year,
      facultyAdvisor: facultyAdvisor ?? this.facultyAdvisor,
      department: department ?? this.department,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      parentIds: parentIds ?? this.parentIds,
      academics: academics ?? this.academics,
      courses: courses ?? this.courses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'regNum': regNum,
      'name': name,
      'email': email,
      'batch': batch,
      'year': year,
      'facultyAdvisor': facultyAdvisor,
      'department': department,
      'whatsappNumber': whatsappNumber,
      'parentIds': parentIds,
      'academics': academics.map((x) => x.toMap()).toList(),
      'courses': courses.map((x) => x.toMap()).toList(),
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as String,
      regNum: map['regNum'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      batch: map['batch'] as String,
      year: map['year'] as String,
      facultyAdvisor: map['facultyAdvisor'] as String,
      department: map['department'] as String,
      whatsappNumber: map['whatsappNumber'] as String,
      parentIds: List<String>.from((map['parentIds'] as List<String>)),
      academics: List<Academics>.from(
        (map['academics'] as List<int>).map<Academics>(
          (x) => Academics.fromMap(x as Map<String, dynamic>),
        ),
      ),
      courses: List<Course>.from(
        (map['courses'] as List<int>).map<Course>(
          (x) => Course.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(id: $id, regNum: $regNum, name: $name, email: $email, batch: $batch, year: $year, facultyAdvisor: $facultyAdvisor, department: $department, whatsappNumber: $whatsappNumber, parentIds: $parentIds, academics: $academics, courses: $courses)';
  }

  @override
  int get hashCode {
    return id.hashCode ^
        regNum.hashCode ^
        name.hashCode ^
        email.hashCode ^
        batch.hashCode ^
        year.hashCode ^
        facultyAdvisor.hashCode ^
        department.hashCode ^
        whatsappNumber.hashCode ^
        parentIds.hashCode ^
        academics.hashCode ^
        courses.hashCode;
  }
}
