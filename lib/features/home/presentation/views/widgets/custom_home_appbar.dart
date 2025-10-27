import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/helper_functions/get_user.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/widgets/notifications_button_widget.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(
          color: const Color(0xffFFFFFF),
        ),
      ),
      subtitle: Text(
        getUser().name,
        style: TextStyles.bold16.copyWith(
          color: const Color(0xffFFFFFF),
        ),
      ),
      trailing: const NotificationWidget(
        color: Colors.white,
      ),
    );
  }
}
