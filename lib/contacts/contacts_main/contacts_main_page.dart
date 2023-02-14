import 'package:architecture_template/contacts/contacts_main/provider/contacts_main_provider.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_main_state.dart';
import 'package:architecture_template/contacts/contacts_main/widgets/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactsMainPage extends ConsumerStatefulWidget {
  const ContactsMainPage({
    required StateNotifierProvider<ContactsMainProvider, ContactsMainState>
        provider,
    Key? key,
  })  : _provider = provider,
        super(key: key);

  final StateNotifierProvider<ContactsMainProvider, ContactsMainState>
      _provider;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContactsMainPageState();
}

class _ContactsMainPageState extends ConsumerState<ContactsMainPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(widget._provider.notifier).initialize(),
    );
  }

  Widget _buildLoader() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildBody(BuildContext context) {
    return ContactsList(contacts: ref.read(widget._provider).contactsUi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ref.watch(widget._provider).isLoading
            ? _buildLoader()
            : _buildBody(context),
      ),
    );
  }
}
