import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/features/profile/presentation/views/widgets/logout_button.dart';

import 'delete_account_button.dart';
import 'help.dart';
import 'profile_view_header.dart';
import 'profile_view_list_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 48.h,
            ),
            const ProfileViewHeader(),
            SizedBox(
              height: 48.h,
            ),
            Text(
              'عام',
              style: TextStyles.bold14.copyWith(
                color: const Color(0xff000000),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const ProfileViewListView(),
            const DeleteAccountButton(),
            SizedBox(
              height: 24.h,
            ),
            const Help(),
            SizedBox(
              height: 88.h,
            ),
            const LogoutButton(),
            SizedBox(
              height: 32.h,
            )
          ],
        ),
      ),
    );
  }
}
