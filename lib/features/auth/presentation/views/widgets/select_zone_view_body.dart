import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/helper_functions/get_user.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/core/widgets/custom_dialog_alert.dart';
import 'package:tmart_expiry_date/features/auth/data/models/zone_model.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/select_zone_cubit/select_zone_cubit.dart';

import '../../../../home/presentation/views/main_view.dart';
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
      name: "زون الحلويات ( زون 2 )",
      value: "2",
    ),
    ZoneModel(
      name: "زون البقوليات ( زون 3 )",
      value: "3",
    ),
    ZoneModel(
      name: "زون المنظفات ( زون 4 )",
      value: "4",
    ),
  ];
  int indexSelected = 0;
  String? zone;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                getUser().zone != ''
                    ? GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(MainView.routeName),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'تخطي',
                            style: TextStyles.semiBold14
                                .copyWith(color: Colors.grey),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 52,
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
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .65,
                  child: Column(
                    children: List.generate(
                      4,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              indexSelected = index;
                              zone = zoneList[index].value;
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
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () async {
                if (zone != null) {
                  if (getUser().zone != zone) {
                    await context
                        .read<SelectZoneCubit>()
                        .selectZoneUser(zone: zone!);
                  } else {
                    customDialogAlert(
                      context: context,
                      text: "انت بالفعل في ${zoneList[indexSelected].name}",
                    );
                  }
                }
              },
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
            ),
          ),
        ],
      ),
    );
  }
}
