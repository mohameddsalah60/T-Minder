import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tmart_expiry_date/features/home/presentation/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    toHomeView(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'T',
            style: TextStyle(
              fontSize: 100.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  void toHomeView(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed(HomeView.routeName);
      },
    );
  }
}
