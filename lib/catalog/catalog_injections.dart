import 'package:dio/dio.dart';
import 'package:flickr_gallery/catalog/infrastructure/catalog_repository.dart';
import 'package:flickr_gallery/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:get_it/get_it.dart';

void registerCatalogInjections(GetIt serviceLocator, Dio client, String apiKey) {
  serviceLocator.registerLazySingleton(
    () => CatalogRepository(
      client,
      apiKey,
    ),
  );

  serviceLocator.registerSingleton(
    CatalogBloc(
      catalogRepository: serviceLocator(),
      sharedPreferencesRepository: serviceLocator(),
    )..add(LoadCrossAxisCountCatalog()),
  );
}
