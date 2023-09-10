// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Parent {
  String? id;
  String name;
  String email;
  String whatsappNumber;
  List<String> studentId;
  bool verified;
  Parent({
    this.id,
    required this.name,
    required this.email,
    required this.whatsappNumber,
    required this.studentId,
    required this.verified,
  });

  Parent copyWith({
    String? id,
    String? name,
    String? email,
    String? whatsappNumber,
    List<String>? studentId,
    bool? verified,
  }) {
    return Parent(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      studentId: studentId ?? this.studentId,
      verified: verified ?? this.verified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'whatsappNumber': whatsappNumber,
      'studentId': studentId,
      'verified': verified,
    };
  }

  factory Parent.fromMap(Map<String, dynamic> map) {
    return Parent(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      whatsappNumber: map['whatsappNumber'] as String,
      studentId: List<String>.from((map['studentId'])),
      verified: map['verified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Parent.fromJson(String source) =>
      Parent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Parent(id: $id, name: $name, email: $email, whatsappNumber: $whatsappNumber, studentId: $studentId, verified: $verified)';
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        whatsappNumber.hashCode ^
        studentId.hashCode ^
        verified.hashCode;
  }
}
