import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flickr_gallery/catalog/domain/photo.dart';
import 'package:flickr_gallery/favourite/infrastructure/favourite_repository.dart';
import 'package:meta/meta.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteRepository _favouriteRepository;
  final List<Photo> _photos = [];

  FavouriteBloc({
    @required FavouriteRepository favouriteRepository,
  })  : _favouriteRepository = favouriteRepository,
        assert(favouriteRepository != null);

  @override
  FavouriteState get initialState => FavouriteInitial();

  @override
  Stream<FavouriteState> mapEventToState(
    FavouriteEvent event,
  ) async* {
    if (event is LoadPhotos) {
      final savedPhotos = await _favouriteRepository.readPhotos();
      _photos.addAll(savedPhotos);
    }
    if (event is AddPhoto) {
      _photos.add(event.photo);
      await _favouriteRepository.writePhotos(_photos);
      yield FavouriteInitial();
    }
    if (event is RemovePhoto) {
      _photos.removeWhere((photo) => photo.id == event.photo.id);
      await _favouriteRepository.writePhotos(_photos);
      yield FavouriteInitial();
    }
  }

  get photos => _photos;
}
