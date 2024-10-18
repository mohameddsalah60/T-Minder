import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/features/home/presentation/cubits/scan_barcode/scan_barcode_cubit.dart';

import 'core/helper_functions/on_generate_routes.dart';
import 'features/auth/presentation/views/signin_view.dart';

void main() {
  runApp(const TmartExpiApp());
}

class TmartExpiApp extends StatelessWidget {
  const TmartExpiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => ScanBarcodeCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SigninView.routeName,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Cairo',
            ),
            onGenerateRoute: onGenerateRoutes,
          ),
        );
      },
    );
  }
}
