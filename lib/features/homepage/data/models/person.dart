import 'address.dart';

class Person {
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

  Person(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.phone,
      this.birthday,
      this.gender,
      this.address,
      this.website,
      this.image});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    phone = json['phone'];
    birthday = json['birthday'];
    gender = json['gender'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    website = json['website'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['website'] = this.website;
    data['image'] = this.image;
    return data;
  }
}
