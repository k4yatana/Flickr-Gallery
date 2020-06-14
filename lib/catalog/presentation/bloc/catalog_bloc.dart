import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flickr_gallery/catalog/domain/flickr_response.dart';
import 'package:flickr_gallery/catalog/domain/page_info.dart';
import 'package:flickr_gallery/catalog/domain/photo.dart';
import 'package:flickr_gallery/catalog/infrastructure/catalog_repository.dart';
import 'package:flickr_gallery/common/repositories/shared_preferences_repository.dart';
import 'package:meta/meta.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CatalogRepository _catalogRepository;
  final SharedPreferencesRepository _sharedPreferencesRepository;
  final _limit = 40;
  final List<int> _crossAxisCounts = [1, 2, 4];
  final _sprefKey = 'CROSS_AXIS_COUNT';

  CatalogBloc({
    @required CatalogRepository catalogRepository,
    @required SharedPreferencesRepository sharedPreferencesRepository,
  })  : _catalogRepository = catalogRepository,
        _sharedPreferencesRepository = sharedPreferencesRepository,
        assert(catalogRepository != null),
        assert(sharedPreferencesRepository != null);

  @override
  CatalogState get initialState => CatalogInitial();

  @override
  Stream<CatalogState> mapEventToState(
    CatalogEvent event,
  ) async* {
    if (event is LoadCrossAxisCountCatalog) {
      final crossAxisCount = _sharedPreferencesRepository.readInt(_sprefKey) ?? 2;
      yield CatalogInitial(
        crossAxisCount: crossAxisCount,
      );
    }

    if (event is NextCrossAxisCountCatalog && state is CatalogLoaded) {
      final index = _crossAxisCounts.indexOf(state.crossAxisCount);
      final crossAxisCount = _crossAxisCounts[(index + 1) % _crossAxisCounts.length];
      _sharedPreferencesRepository.writeInt(_sprefKey, crossAxisCount);
      yield CatalogLoaded(
        photos: state.photos,
        page: state.page,
        crossAxisCount: crossAxisCount,
        tag: state.tag,
      );
    }

    if (event is RefreshCatalog) {
      final tag = state.tag;
      yield CatalogInitial(
        crossAxisCount: state.crossAxisCount,
      );
      yield* _mapFetchCatalogEventToState(_limit, state.page.nextPage(), tag);
    }

    if (event is ClearSearchCatalog) {
      yield CatalogInitial(
        crossAxisCount: state.crossAxisCount,
      );
      yield* _mapFetchCatalogEventToState(_limit, state.page.nextPage());
    }

    if (event is SearchCatalog && event.tag.isNotEmpty) {
      yield CatalogInitial(
        crossAxisCount: state.crossAxisCount,
      );
      yield* _mapFetchCatalogEventToState(_limit, state.page.nextPage(), event.tag);
    }

    if (event is FetchCatalog) {
      yield* _mapFetchCatalogEventToState(_limit, state.page.nextPage(), state.tag);
    }
  }

  bool _hasReachedMax() => state is CatalogLoaded && state.page.isLastPage;

  Stream<CatalogState> _mapFetchCatalogEventToState(int limit, PageInfo pageInfo, [String tag]) async* {
    if (!_hasReachedMax() || state is CatalogInitial) {
      yield CatalogLoading(
        photos: state.photos,
        page: state.page,
        crossAxisCount: state.crossAxisCount,
        tag: tag,
      );
      try {
        final response = await _fetchPhotos(limit, pageInfo, tag);
        yield CatalogLoaded(
          photos: state.photos + response.photos,
          page: response.pageInfo,
          crossAxisCount: state.crossAxisCount,
          tag: tag,
        );
      } catch (e) {
        yield CatalogError(
          crossAxisCount: state.crossAxisCount,
          tag: tag,
        );
      }
    }
  }

  Future<FlickrResponse> _fetchPhotos(int limit, PageInfo pageInfo, [String tag]) {
    if (tag != null) {
      return _catalogRepository.fetchPhotosByTag(limit, pageInfo.page, tag);
    }
    return _catalogRepository.fetchPhotos(limit, pageInfo.page);
  }
}
