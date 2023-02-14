import 'package:architecture_template/contacts/contacts_main/models/contact_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_ui.freezed.dart';

@freezed
class ContactUi with _$ContactUi {
  const factory ContactUi({
    required String name,
  }) = _ContactUi;

  factory ContactUi.fromResponse(ContactResponse response) =>
      ContactUi(name: response.name);
}
