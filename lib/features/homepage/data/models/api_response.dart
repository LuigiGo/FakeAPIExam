import 'person.dart';

class ApiResponse {
  String? status;
  int? code;
  int? total;
  List<Person>? data;

  ApiResponse({this.status, this.code, this.total, this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Person>[];
      json['data'].forEach((v) {
        data!.add(Person.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
