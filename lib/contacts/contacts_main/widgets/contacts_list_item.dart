import 'package:architecture_template/common/di/injector.dart';
import 'package:architecture_template/common/ui/app_text_styles.dart';
import 'package:architecture_template/contacts/common/models/contact_ui.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_main_provider.dart';
import 'package:architecture_template/contacts/contacts_main/provider/contacts_main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsListItem extends ConsumerWidget {
  const ContactsListItem({required ContactUi contact, Key? key})
      : _contact = contact,
        super(key: key);

  final ContactUi _contact;

  void _onTapRemove(BuildContext context, WidgetRef ref) {
    final provider =
        getIt<StateNotifierProvider<ContactsMainProvider, ContactsMainState>>();
    ref.read(provider.notifier).removeContact();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(child: Text(_contact.name, style: AppTextStyles.bold)),
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () => _onTapRemove(context, ref),
            child: Icon(Icons.close, size: 20.w),
          ),
        ],
      ),
    );
  }
}
