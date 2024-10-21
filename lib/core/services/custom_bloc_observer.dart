import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      log("${bloc.runtimeType} $transition");
    }
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      log('${bloc.runtimeType} $change');
    }
    super.onChange(bloc, change);
  }
}
