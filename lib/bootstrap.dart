import 'package:dio/dio.dart';
import 'package:flickr_gallery/app.dart';
import 'package:flickr_gallery/config.dart';
import 'package:flickr_gallery/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './injections.dart' as di;

void bootstrapApp(Config config) async {
  assert(config != null);

  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio(
    BaseOptions(
      baseUrl: config.baseUrl,
    ),
  );

  final prefs = await SharedPreferences.getInstance();

  await di.init(
    serviceLocator: serviceLocator,
    client: dio,
    apiKey: config.apiKey,
    prefs: prefs,
  );

  runApp(FlickrGalleryApp());
}
