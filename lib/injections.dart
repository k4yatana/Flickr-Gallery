import 'package:dio/dio.dart';
import 'package:flickr_gallery/catalog/catalog_injections.dart';
import 'package:flickr_gallery/common/register_common_injections.dart';
import 'package:flickr_gallery/favourite/favourite_injections.dart';
import 'package:flickr_gallery/main_app_bar/main_app_bar_injections.dart';
import 'package:meta/meta.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init({
  @required GetIt serviceLocator,
  @required Dio client,
  @required String apiKey,
  @required SharedPreferences prefs,
}) async {
  assert(serviceLocator != null);
  assert(client != null);
  assert(apiKey != null);
  assert(prefs != null);
  registerCommonInjections(serviceLocator, prefs);
  registerCatalogInjections(serviceLocator, client, apiKey);
  registerMainAppBarInjections(serviceLocator);
  registerFavouriteInjections(serviceLocator);
}
