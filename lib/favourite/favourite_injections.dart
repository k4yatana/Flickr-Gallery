import 'package:flickr_gallery/favourite/infrastructure/favourite_repository.dart';
import 'package:flickr_gallery/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:get_it/get_it.dart';

void registerFavouriteInjections(GetIt serviceLocator) {
  serviceLocator.registerLazySingleton(
    () => FavouriteRepository(),
  );

  serviceLocator.registerSingleton(
    FavouriteBloc(
      favouriteRepository: serviceLocator(),
    )..add(LoadPhotos()),
  );
}
