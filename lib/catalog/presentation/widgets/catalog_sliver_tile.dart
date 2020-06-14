import 'package:flickr_gallery/catalog/domain/photo.dart';
import 'package:flickr_gallery/catalog/presentation/widgets/catalog_image_view.dart';
import 'package:flickr_gallery/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:flickr_gallery/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogSliverTile extends StatelessWidget {
  final Photo photo;

  CatalogSliverTile({
    @required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CatalogImageView(
              url: photo.imageUrl,
            ),
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Image.network(
            // errorBuilder bug: https://github.com/flutter/flutter/issues/56454
            photo.smallImageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          BlocProvider.value(
            value: serviceLocator<FavouriteBloc>(),
            child: BlocBuilder<FavouriteBloc, FavouriteState>(
              builder: (context, state) {
                final favouritePhoto = context.bloc<FavouriteBloc>().photos.any((favouritePhoto) => favouritePhoto.id == photo.id);
                return Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (favouritePhoto) {
                        context.bloc<FavouriteBloc>().add(RemovePhoto(photo: photo));
                      } else {
                        context.bloc<FavouriteBloc>().add(AddPhoto(photo: photo));
                      }
                    },
                    child: SizedBox(
                      height: 40.0,
                      width: 40.0,
                      child: Icon(
                        favouritePhoto ? Icons.favorite : Icons.favorite_border,
                        color: favouritePhoto ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            )
          ),
        ],
      ),
    );
  }
}