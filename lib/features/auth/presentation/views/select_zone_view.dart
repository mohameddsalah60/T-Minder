import 'package:flutter/material.dart';

import 'widgets/select_zone_view_body.dart';

class SelectZoneView extends StatelessWidget {
  const SelectZoneView({super.key});
  static const routeName = 'selectZoneView';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SelectZoneViewBody(),
      ),
    );
  }
}
