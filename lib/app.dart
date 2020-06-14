import 'package:flickr_gallery/home_page.dart';
import 'package:flutter/material.dart';

class FlickrGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flickr Gallery',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(98, 2, 238, 1),
        scaffoldBackgroundColor: Color.fromRGBO(181, 201, 253, 1),
      ),
      home: HomePage(),
    );
  }
}
