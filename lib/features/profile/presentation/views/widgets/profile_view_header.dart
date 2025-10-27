import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_user.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            getUser().name,
            style: TextStyles.bold16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Center(
          child: Text(
            getUser().email,
            style:
                TextStyles.semiBold16.copyWith(color: const Color(0xff888FA0)),
          ),
        ),
      ],
    );
  }
}
