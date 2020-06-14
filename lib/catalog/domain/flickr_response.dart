import 'package:flickr_gallery/catalog/domain/page_info.dart';
import 'package:flickr_gallery/catalog/domain/photo.dart';
import 'package:meta/meta.dart';

@immutable
class FlickrResponse {
  final List<Photo> photos;
  final PageInfo pageInfo;

  const FlickrResponse({
    @required this.photos,
    @required this.pageInfo,
  })  : assert(photos != null),
        assert(pageInfo != null);
}
