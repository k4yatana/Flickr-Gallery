import 'package:flickr_gallery/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:flickr_gallery/catalog/presentation/widgets/catalog_scroll_view_wrapper.dart';
import 'package:flickr_gallery/catalog/presentation/widgets/catalog_sliver_grid.dart';
import 'package:flickr_gallery/common/widgets/message.dart';
import 'package:flickr_gallery/common/widgets/preloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 50.0;
  CatalogBloc _catalogBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _catalogBloc = context.bloc<CatalogBloc>()..add(FetchCatalog());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      bloc: _catalogBloc,
      builder: (context, state) {
        if (state is CatalogError) {
          return CatalogScrollViewWrapper(
            child: Message(
              message: 'Возникли проблемы \nпри загрузке изображений',
            ),
          );
        }
        final photos = state.photos;
        if (state is CatalogLoaded && photos.isEmpty) {
          return CatalogScrollViewWrapper(
            child: Message(
              message: 'Не удалось найти?\nПопробуйте изменить запрос',
            ),
          );
        }
        return CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            if (photos.isNotEmpty)
              CatalogSliverGrid(
                photos: photos,
                crossAxisCount: state.crossAxisCount,
              ),
            if (state is CatalogError)
              SliverFillRemaining(
                child: Message(
                  message: 'Возникли проблемы \nпри загрузке изображений',
                ),
              ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Visibility(
                visible: state is CatalogLoading,
                child: Preloader(),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_catalogBloc.state is! CatalogLoading && !_catalogBloc.state.page.isLastPage) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScroll - currentScroll <= _scrollThreshold) {
        _catalogBloc.add(FetchCatalog());
      }
    }
  }
}
