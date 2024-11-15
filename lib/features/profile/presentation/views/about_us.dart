import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';

import 'widgets/about_us_body.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
  static const routeName = 'about-us';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'من نحن',
        onTap: () => Navigator.of(context).pop(),
      ),
      body: const AboutUsBody(),
    );
  }
}
