import 'package:flickr_gallery/bootstrap.dart';
import 'package:flickr_gallery/config.dart';

void main() {
  bootstrapApp(Config(
    baseUrl: 'https://www.flickr.com/services/rest',
    apiKey: null,
  ));
}
