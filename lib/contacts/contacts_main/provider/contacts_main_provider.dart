import 'package:architecture_template/contacts/common/models/contact_ui.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_main_state.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactsMainProvider extends StateNotifier<ContactsMainState> {
  ContactsMainProvider(this._contactsRepository) : super(ContactsMainState());

  final ContactsRepository _contactsRepository;

  Future<void> initialize() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _contactsRepository.fetchContacts();

      state = state.copyWith(
        isLoading: false,
        contactsUi: response.map(ContactUi.fromResponse).toList(),
      );
    } on Exception catch (_) {
      state = state.copyWith(
        isLoading: false,
        isError: true,
      );
    }
  }

  Future<void> createContact(String contact) async {}

  Future<void> removeContact() async {}
}
