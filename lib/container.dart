import 'package:get_it/get_it.dart';
import 'package:ibuild_vendor/core/utils/app_utils/api_client.dart';
import 'package:ibuild_vendor/features/home/data/datasources/homeremotedatasources.dart';

import 'features/features.dart';

GetIt locator = GetIt.instance;

void initServiceLocator() {
  locator.registerSingleton<ApiClient>(ApiClient());

  locator.registerSingleton<AuthRemoteDatasource>(
    AuthRemoteDatasource(
      client: locator(),
    ),
  );

  locator.registerSingleton<HomeRemoteDatasources>(
    HomeRemoteDatasources(
      client: locator(),
    ),
  );
}
