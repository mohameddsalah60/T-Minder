import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl_standalone.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tmart_expiry_date/core/services/custom_bloc_observer.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';
import 'package:tmart_expiry_date/core/services/shared_preferences_singletone.dart';
import 'package:tmart_expiry_date/generated/l10n.dart';

import 'core/helper_functions/excute_navigation.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'core/products_cubit/products_cubit.dart';
import 'core/repos/products_repo.dart';
import 'core/services/notifications_service.dart';
import 'core/services/workmanager_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = CustomBlocObserver();
  await Prefs.init();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  Future.wait([
    findSystemLocale(),
    NotificationsService.init(),
    WorkmanagerService.init(),
  ]);

  setupGetItService();
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
          create: (context) =>
              ProductsCubit(getIt<ProductsRepo>())..getProducts(),
          child: MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('ar'),
            debugShowCheckedModeBanner: false,
            initialRoute: excuteNaviagtion(),
            theme: ThemeData(
              brightness: Brightness.light,
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
