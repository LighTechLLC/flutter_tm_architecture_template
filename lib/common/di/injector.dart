import 'package:architecture_template/common/env/config.dart';
import 'package:architecture_template/common/env/environment.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_main_provider.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_main_state.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final config = Environment<Config>.instance().config;

  final dio = Dio(BaseOptions(baseUrl: config.baseUrl));

  getIt
    ..registerSingleton(ContactsRepository(dio))
    ..registerSingleton(ContactsMainProvider(getIt<ContactsRepository>()))
    ..registerSingleton(
      StateNotifierProvider<ContactsMainProvider, ContactsMainState>(
        (ref) => getIt<ContactsMainProvider>(),
      ),
    );
}
