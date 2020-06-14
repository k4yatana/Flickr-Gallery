import 'package:meta/meta.dart';

@immutable
class Photo {
  final String id;
  final String secret;
  final String server;
  final int farm;

  const Photo({
    @required this.id,
    @required this.secret,
    @required this.server,
    @required this.farm,
  })  : assert(id != null),
        assert(secret != null),
        assert(server != null),
        assert(farm != null);

  factory Photo.fromJson(json) => Photo(
        id: json['id'],
        secret: json['secret'],
        server: json['server'],
        farm: json['farm'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'secret': secret,
        'server': server,
        'farm': farm,
      };

  get imageUrl => 'https://farm$farm.staticflickr.com/$server/$id\_$secret.jpg';
  get smallImageUrl => 'https://farm$farm.staticflickr.com/$server/$id\_$secret\_m.jpg';
}
