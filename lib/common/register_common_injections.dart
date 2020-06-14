import 'package:flickr_gallery/common/repositories/shared_preferences_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void registerCommonInjections(GetIt serviceLocator, SharedPreferences prefs) {
  serviceLocator.registerLazySingleton(
    () => SharedPreferencesRepository(
      prefs,
    ),
  );
}
