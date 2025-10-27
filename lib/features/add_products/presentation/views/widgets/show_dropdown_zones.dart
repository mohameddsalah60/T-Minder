import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

void showDropdownZones(
  BuildContext context, {
  required TextEditingController controller,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'اختار الزون',
          style: TextStyles.bold14,
        ),
        content: SizedBox(
          height: 200.h,
          width: double.maxFinite,
          child: ZonesList(
            controller: controller,
          ),
        ),
      );
    },
  );
}

class ZonesList extends StatefulWidget {
  const ZonesList({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  State<ZonesList> createState() => _ZonesListState();
}

class _ZonesListState extends State<ZonesList> {
  List<String> zones = ['زون 1', 'زون 2', 'زون 3', 'زون 4'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: zones.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              zones[index],
              style: TextStyles.semiBold14,
            ),
            onTap: () {
              setState(() {
                widget.controller.text = zones[index];
              });
              Navigator.of(context).pop();
            },
          );
        });
  }
}
