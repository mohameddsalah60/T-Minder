import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/features/auth/data/models/zone_model.dart';

class SelectZoneButton extends StatelessWidget {
  const SelectZoneButton({
    super.key,
    required this.isSelected,
    required this.zoneModel,
  });
  final ZoneModel zoneModel;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .095,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? Colors.yellow : const Color(0xffDDDFDF),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          zoneModel.name,
          textAlign: TextAlign.center,
          style: TextStyles.bold14.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
