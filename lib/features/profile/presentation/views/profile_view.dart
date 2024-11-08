import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profile-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'حسابي',
      ),
      body: const ProfileViewBody(),
    );
  }
}
