import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_response.freezed.dart';
part 'contact_response.g.dart';

@Freezed(toJson: false)
class ContactResponse with _$ContactResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
  const factory ContactResponse({required String name}) = _ContactResponse;

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);
}
