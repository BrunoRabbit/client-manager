// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClientModel {
  ClientModel({
    this.id,
    required this.name,
    required this.email,
    this.tags = const [],
  });

  final int? id;
  final String name;
  final String email;
  final List<String> tags;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'tags': tags,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      tags: map['tags'] != ""
          ? List<String>.from(
              map['tags'].map((tag) => tag as String),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ClientModel copyWith({
    int? id,
    String? name,
    String? email,
    List<String>? tags,
  }) {
    return ClientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      tags: tags ?? this.tags,
    );
  }
}
