import 'package:architecture_template/common/di/injector.dart';
import 'package:architecture_template/common/routes.dart';
import 'package:architecture_template/contacts/contacts_main/contacts_main_page.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_main_provider.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoutesFactory {
  static String get initialRoute => Routes.contactsMain;

  Map<String, Widget Function(BuildContext)> get _routes => {
        Routes.contactsMain: (context) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: ContactsMainPage(
              provider: getIt<
                  StateNotifierProvider<ContactsMainProvider,
                      ContactsMainState>>(),
            ),
          );
        },
      };

  Route<dynamic> getGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (context) => _routes[settings.name]!(context),
        );
    }
  }
}
