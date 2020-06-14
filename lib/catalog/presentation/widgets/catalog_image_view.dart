import 'package:flickr_gallery/common/widgets/preloader.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CatalogImageView extends StatelessWidget {
  final String url;

  CatalogImageView({
    @required this.url,
  }) : assert(url != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: PhotoView(
        imageProvider: NetworkImage(url),
        loadingBuilder: (context, chunk) {
          return Preloader();
        },
        minScale: PhotoViewComputedScale.contained * 1.0,
        maxScale: PhotoViewComputedScale.covered * 2.5,
      ),
    );
  }
}
