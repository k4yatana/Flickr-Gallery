import 'package:flickr_gallery/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:flickr_gallery/common/widgets/input.dart';
import 'package:flickr_gallery/main_app_bar/presentation/bloc/main_app_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBarTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        return Input(
          autofocus: true,
          text: state.tag,
          hintText: 'Введите поисковой запрос',
          onSubmitted: (text) {
            context.bloc<CatalogBloc>().add(SearchCatalog(
              tag: text,
            ));
            context.bloc<MainAppBarBloc>().add(TextFieldSubmitted());
          },
          onBackTap: (text) {
            context.bloc<MainAppBarBloc>().add(TextFieldBackButtonPressed());
          },
        );
      },
    );
  }
}
