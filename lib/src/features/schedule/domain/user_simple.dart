import 'dart:convert';

import 'package:aba_pi5_poc/src/core/constants.dart';
import 'package:faker/faker.dart';
import 'package:flutter/widgets.dart';

class SimpleUser {
  String? imageData;
  String? name;
  int? age;
  SimpleUser({
    this.imageData,
    this.name,
    this.age,
  });

  SimpleUser copyWith({
    ValueGetter<String?>? imageData,
    ValueGetter<String?>? name,
    ValueGetter<int?>? age,
  }) {
    return SimpleUser(
      imageData: imageData != null ? imageData() : this.imageData,
      name: name != null ? name() : this.name,
      age: age != null ? age() : this.age,
    );
  }

  factory SimpleUser.fake() {
    return SimpleUser(
      age: faker.randomGenerator.integer(16).toInt(),
      name: faker.person.name(),
      imageData: kBase64Image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageData': imageData,
      'name': name,
      'age': age,
    };
  }

  factory SimpleUser.fromMap(Map<String, dynamic> map) {
    return SimpleUser(
      imageData: map['imageData'],
      name: map['name'],
      age: map['age']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory SimpleUser.fromJson(String source) =>
      SimpleUser.fromMap(json.decode(source));

  @override
  String toString() =>
      'SimpleUser(imageData: $imageData, name: $name, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SimpleUser &&
        other.imageData == imageData &&
        other.name == name &&
        other.age == age;
  }

  @override
  int get hashCode => imageData.hashCode ^ name.hashCode ^ age.hashCode;
}
