import 'package:flickr_gallery/main_app_bar/presentation/bloc/main_app_bar_bloc.dart';
import 'package:flickr_gallery/main_app_bar/presentation/widgets/main_app_bar_clear_button.dart';
import 'package:flickr_gallery/main_app_bar/presentation/widgets/main_app_bar_grid_button.dart';
import 'package:flickr_gallery/main_app_bar/presentation/widgets/main_app_bar_favourite_button.dart';
import 'package:flickr_gallery/main_app_bar/presentation/widgets/main_app_bar_search_button.dart';
import 'package:flickr_gallery/main_app_bar/presentation/widgets/main_app_bar_text_field.dart';
import 'package:flickr_gallery/main_app_bar/presentation/widgets/main_app_bar_title.dart';
import 'package:flickr_gallery/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<MainAppBarBloc>(),
      child: BlocBuilder<MainAppBarBloc, MainAppBarState>(
        builder: (context, state) {
          return AppBar(
            title: state is ShowSearchTextField
                ? MainAppBarTextField()
                : MainAppBarTitle(),
            actions: state is ShowActions
                ? <Widget>[
                    MainAppBarClearButton(),
                    MainAppBarSearchButton(),
                    MainAppBarFavouriteButton(),
                    MainAppBarGridButton(),
                  ]
                : null,
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
