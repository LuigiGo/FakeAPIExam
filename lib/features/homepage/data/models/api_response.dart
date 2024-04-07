import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'person.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse extends Equatable {
  String? status;
  int? code;
  int? total;
  List<Person>? data;

  ApiResponse({
    this.status,
    this.code,
    this.total,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  @override
  List<Object?> get props => [
        status,
        code,
        total,
        data,
      ];
}
