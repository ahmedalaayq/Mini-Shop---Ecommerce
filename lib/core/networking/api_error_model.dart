
import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable(createJsonSchema: true)
class ApiErrorModel {
  ApiErrorModel({required this.message, required this.code});
  final String message;
  @JsonKey(name: 'statusCode')
  final int code;

  factory ApiErrorModel.fromJson(Map<String,dynamic> json) => _$ApiErrorModelFromJson(json);
}
