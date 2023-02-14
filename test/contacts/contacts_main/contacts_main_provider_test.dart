import 'package:architecture_template/contacts/common/models/contact_ui.dart';
import 'package:architecture_template/contacts/contacts_main/models/contact_response.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_main_provider.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_main_state.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contacts_main_provider_test.mocks.dart';

@GenerateMocks([ContactsRepository])
void main() {
  final contactsRepository = MockContactsRepository();
  final ref = ProviderContainer();

  const contactsResponse = [
    ContactResponse(
      name: 'name',
    ),
  ];

  const contactsUi = [
    ContactUi(
      name: 'name',
    ),
  ];

  test('Check default state', () {
    final provider =
        StateNotifierProvider<ContactsMainProvider, ContactsMainState>(
      (ref) => ContactsMainProvider(contactsRepository),
    );

    final state = ref.read(provider);
    expect(state, ContactsMainState());
  });

  test('Check successful loading', () async {
    final provider =
        StateNotifierProvider<ContactsMainProvider, ContactsMainState>(
      (ref) => ContactsMainProvider(contactsRepository),
    );

    when(contactsRepository.fetchContacts())
        .thenAnswer((_) async => contactsResponse);

    await ref.read(provider.notifier).initialize();

    expect(
      ref.read(provider),
      ContactsMainState(
        contactsUi: contactsUi,
        isLoading: false,
        isError: false,
      ),
    );
  });

  test('Check error state', () async {
    final provider =
        StateNotifierProvider<ContactsMainProvider, ContactsMainState>(
      (ref) => ContactsMainProvider(contactsRepository),
    );

    when(contactsRepository.fetchContacts()).thenThrow(Exception());

    await ref.read(provider.notifier).initialize();
    expect(
      ref.read(provider),
      ContactsMainState(
        contactsUi: [],
        isLoading: false,
        isError: true,
      ),
    );
  });
}
