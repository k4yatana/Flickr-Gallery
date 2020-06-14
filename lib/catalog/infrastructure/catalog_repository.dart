import 'package:dio/dio.dart';
import 'package:flickr_gallery/catalog/domain/flickr_response.dart';
import 'package:flickr_gallery/catalog/domain/page_info.dart';
import 'package:flickr_gallery/catalog/domain/photo.dart';

class CatalogRepository {
  final Dio _client;
  final String _apiKey;

  CatalogRepository(
    this._client,
    this._apiKey,
  )   : assert(_client != null),
        assert(_apiKey != null);

  Future<FlickrResponse> fetchPhotos(int limit, int page) async {
    final response = await _client.get(
      '/',
      queryParameters: {
        'method': 'flickr.photos.getRecent',
        ..._baseParameters,
        'per_page': limit,
        'page': page,
      },
    );

    return _parseResponse(response);
  }

  Future<FlickrResponse> fetchPhotosByTag(
      int limit, int page, String tag) async {
    final response = await _client.get(
      '/',
      queryParameters: {
        'method': 'flickr.photos.search',
        ..._baseParameters,
        'tags': tag,
        'per_page': limit,
        'page': page,
      },
    );

    return _parseResponse(response);
  }

  FlickrResponse _parseResponse(dynamic response) {
    final photos = response.data['photos']['photo']
        .map<Photo>((json) => Photo.fromJson(json))
        .toList();
    final pageInfo = PageInfo.fromJson(response.data['photos']);

    return FlickrResponse(
      photos: photos,
      pageInfo: pageInfo,
    );
  }

  get _baseParameters => {
        'format': 'json',
        'nojsoncallback': 1,
        'api_key': _apiKey,
      };
}
