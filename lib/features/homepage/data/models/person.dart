import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'person.g.dart';

@JsonSerializable()
class Person extends Equatable {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? birthday;
  String? gender;
  Address? address;
  String? website;
  String? image;

  Person({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.birthday,
    this.gender,
    this.address,
    this.website,
    this.image,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  List<Object?> get props => [
        id,
        firstname,
        lastname,
        email,
        phone,
        birthday,
        gender,
        address,
        website,
        image,
      ];
}
