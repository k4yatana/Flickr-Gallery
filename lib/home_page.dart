import 'package:flickr_gallery/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:flickr_gallery/catalog/presentation/catalog.dart';
import 'package:flickr_gallery/catalog/presentation/widgets/catalog_refresh_wrapper.dart';
import 'package:flickr_gallery/main_app_bar/presentation/main_app_bar.dart';
import 'package:flickr_gallery/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<CatalogBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: MainAppBar(),
        body: SafeArea(
          child: CatalogRefreshWrapper(
            child: Catalog(),
          ),
        ),
      ),
    );
  }
}
