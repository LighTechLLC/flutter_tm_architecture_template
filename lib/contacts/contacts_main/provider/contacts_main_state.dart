import 'package:architecture_template/contacts/common/models/contact_ui.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_main_state.freezed.dart';

@freezed
class ContactsMainState with _$ContactsMainState {
  factory ContactsMainState({
    @Default(<ContactUi>[]) List<ContactUi> contactsUi,
    @Default(true) bool isLoading,
    @Default(false) bool isError,
  }) = _ContactsMainState;
}
