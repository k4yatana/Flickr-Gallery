import 'package:flickr_gallery/catalog/domain/photo.dart';
import 'package:flickr_gallery/catalog/presentation/widgets/catalog_sliver_tile.dart';
import 'package:flutter/material.dart';

class CatalogSliverGrid extends StatelessWidget {
  final List<Photo> photos;
  final int crossAxisCount;

  CatalogSliverGrid({
    @required this.photos,
    @required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          childAspectRatio: crossAxisCount == 1 ? 3 : 1,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return CatalogSliverTile(
              photo: photos[index],
            );
          },
          childCount: photos.length,
        ),
      ),
    );
  }
}
