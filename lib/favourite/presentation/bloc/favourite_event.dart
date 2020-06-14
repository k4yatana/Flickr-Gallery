part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteEvent {}

class LoadPhotos extends FavouriteEvent {}

class AddPhoto extends FavouriteEvent {
  final Photo photo;

  AddPhoto({
    @required this.photo,
  });
}

class RemovePhoto extends FavouriteEvent {
  final Photo photo;

  RemovePhoto({
    @required this.photo,
  });
}
