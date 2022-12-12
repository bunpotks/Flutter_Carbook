import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/screens/details/components/custom_app_bar.dart';

class PhotoViewArguments {
  final String img;
  final int id;

  PhotoViewArguments(this.img, this.id);
}

class PhotoViewScreen extends StatelessWidget {
  const PhotoViewScreen({super.key});

  static const routeName = '/photoViewScreen';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PhotoViewArguments;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: 0),
      ),
      // appBar: AppBar(title: Text('PhotoView')),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Hero(
          tag: args.id,
          child: PhotoView(
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.covered * 2.5,
            imageProvider: NetworkImage(args.img),
          ),
        ),
      ),
    );
  }
}
