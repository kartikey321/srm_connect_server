// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Academics {
  String studentId;
  double cgpa;
  double sgpa;
  List<String> backlog;
  Academics({
    required this.studentId,
    required this.cgpa,
    required this.sgpa,
    required this.backlog,
  });

  Academics copyWith({
    String? studentId,
    double? cgpa,
    double? sgpa,
    List<String>? backlog,
  }) {
    return Academics(
      studentId: studentId ?? this.studentId,
      cgpa: cgpa ?? this.cgpa,
      sgpa: sgpa ?? this.sgpa,
      backlog: backlog ?? this.backlog,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentId': studentId,
      'cgpa': cgpa,
      'sgpa': sgpa,
      'backlog': backlog,
    };
  }

  factory Academics.fromMap(Map<String, dynamic> map) {
    return Academics(
      studentId: map['studentId'] as String,
      cgpa: map['cgpa'] as double,
      sgpa: map['sgpa'] as double,
      backlog: List<String>.from((map['backlog'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Academics.fromJson(String source) =>
      Academics.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Academics(studentId: $studentId, cgpa: $cgpa, sgpa: $sgpa, backlog: $backlog)';
  }

  @override
  int get hashCode {
    return studentId.hashCode ^
        cgpa.hashCode ^
        sgpa.hashCode ^
        backlog.hashCode;
  }
}
