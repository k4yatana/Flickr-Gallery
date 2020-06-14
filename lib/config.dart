import 'package:meta/meta.dart';

@immutable
class Config {
  final String baseUrl;
  final String apiKey;

  Config({
    @required this.baseUrl,
    @required this.apiKey,
  })  : assert(baseUrl != null),
        assert(apiKey != null);
}
