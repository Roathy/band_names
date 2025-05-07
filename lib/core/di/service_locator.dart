import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../router/router.dart';
import '../theme/app_theme.dart';

final GetIt sl = GetIt.I;

void initDependencies() {
  sl.registerLazySingleton<AppRouter>(() => AppRouter());
  sl.registerLazySingleton<ThemeData>(() => AppTheme.lightTheme);
}
