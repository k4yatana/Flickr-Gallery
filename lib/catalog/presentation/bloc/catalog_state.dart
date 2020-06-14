part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState {
  final List<Photo> photos = const [];
  PageInfo get page;
  int get crossAxisCount;
  final String tag = null;
}

class CatalogInitial extends CatalogState {
  final List<Photo> photos = [];
  final page = PageInfo.empty();
  final int crossAxisCount;

  CatalogInitial({
    this.crossAxisCount = 2,
  });
}

class CatalogError extends CatalogState {
  final List<Photo> photos = [];
  final page = PageInfo.empty();
  final int crossAxisCount;
  final String tag;

  CatalogError({
    @required this.crossAxisCount,
    @required this.tag,
  });
}

class CatalogLoading extends CatalogState {
  final List<Photo> photos;
  final PageInfo page;
  final int crossAxisCount;
  final String tag;

  CatalogLoading({
    @required this.photos,
    @required this.page,
    @required this.crossAxisCount,
    @required this.tag,
  });
}

class CatalogLoaded extends CatalogState {
  final List<Photo> photos;
  final PageInfo page;
  final int crossAxisCount;
  final String tag;

  CatalogLoaded({
    @required this.photos,
    @required this.page,
    @required this.crossAxisCount,
    @required this.tag,
  });
}
