import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/features/auth/data/models/zone_model.dart';

import 'select_zone_button.dart';

class SelectZoneViewBody extends StatefulWidget {
  const SelectZoneViewBody({super.key});

  @override
  State<SelectZoneViewBody> createState() => _SelectZoneViewBodyState();
}

class _SelectZoneViewBodyState extends State<SelectZoneViewBody> {
  List<ZoneModel> zoneList = [
    ZoneModel(
      name: "زون الفريش والمجمدات ( زون 1 )",
      value: "1",
    ),
    ZoneModel(
      name: "زون البقوليات ( زون 2 )",
      value: "2",
    ),
    ZoneModel(
      name: "زون الحلويات ( زون 3 )",
      value: "3",
    ),
    ZoneModel(
      name: "زون المنظفات ( زون 4 )",
      value: "4",
    ),
  ];
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 64,
          ),
          Text(
            "ايه الزون بتاعتك؟",
            style: TextStyles.bold16,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "اختار الزون من المقترحين عشان يقدر يوصلك كل الاشعارات الخاصة بالزون بتاعتك.",
            style: TextStyles.semiBold14,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(
            height: 36,
          ),
          Column(
            children: List.generate(
              4,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      indexSelected = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SelectZoneButton(
                      zoneModel: zoneList[index],
                      isSelected: indexSelected == index,
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * .085,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color(0xffDDDFDF),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'متابعة',
                  style: TextStyles.bold14
                      .copyWith(color: const Color(0xffFFFFFF)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
