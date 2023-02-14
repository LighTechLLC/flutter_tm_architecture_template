import 'package:architecture_template/common/ui/app_text_styles.dart';
import 'package:architecture_template/contacts/common/models/contact_ui.dart';
import 'package:architecture_template/contacts/contacts_main/widgets/contacts_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({required List<ContactUi> contacts, Key? key})
      : _contactsList = contacts,
        super(key: key);

  final List<ContactUi> _contactsList;

  @override
  Widget build(BuildContext context) {
    return _contactsList.isEmpty
        ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                AppLocalizations.of(context)!.emptyContactsList,
                style: AppTextStyles.regular.copyWith(fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) => ContactsListItem(
              contact: _contactsList[index],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
            itemCount: _contactsList.length,
          );
  }
}
