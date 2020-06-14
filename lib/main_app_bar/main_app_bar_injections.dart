import 'package:flickr_gallery/main_app_bar/presentation/bloc/main_app_bar_bloc.dart';
import 'package:get_it/get_it.dart';

void registerMainAppBarInjections(GetIt serviceLocator) {
  serviceLocator.registerSingleton(
    MainAppBarBloc(),
  );
}
