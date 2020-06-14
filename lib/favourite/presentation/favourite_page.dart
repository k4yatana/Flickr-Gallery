import 'package:flickr_gallery/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:flickr_gallery/catalog/presentation/widgets/catalog_sliver_grid.dart';
import 'package:flickr_gallery/common/widgets/message.dart';
import 'package:flickr_gallery/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:flickr_gallery/main_app_bar/presentation/widgets/main_app_bar_grid_button.dart';
import 'package:flickr_gallery/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          MainAppBarGridButton(),
        ],
      ),
      body: BlocProvider.value(
        value: serviceLocator<FavouriteBloc>(),
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            if (context.bloc<FavouriteBloc>().photos.isEmpty) {
              return Message(
                message: 'Список избранного пуст\nПопробуйте добавить изображения',
              );
            }
            return CustomScrollView(
              slivers: <Widget>[
                BlocBuilder<CatalogBloc, CatalogState>(
                  builder: (context, state) {
                    return CatalogSliverGrid(
                      photos: context.bloc<FavouriteBloc>().photos,
                      crossAxisCount: context.bloc<CatalogBloc>().state.crossAxisCount,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
