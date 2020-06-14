part of 'catalog_bloc.dart';

@immutable
abstract class CatalogEvent {}

class FetchCatalog extends CatalogEvent {}

class RefreshCatalog extends CatalogEvent {}

class ClearSearchCatalog extends CatalogEvent {}

class NextCrossAxisCountCatalog extends CatalogEvent {}

class LoadCrossAxisCountCatalog extends CatalogEvent {}

class SearchCatalog extends CatalogEvent {
  final String tag;

  SearchCatalog({
    @required this.tag,
  });
}
