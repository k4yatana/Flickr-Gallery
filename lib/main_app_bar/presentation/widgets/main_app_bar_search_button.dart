import 'package:flickr_gallery/main_app_bar/presentation/bloc/main_app_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBarSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        context.bloc<MainAppBarBloc>().add(SearchButtonPressed());
      },
    );
  }
}
