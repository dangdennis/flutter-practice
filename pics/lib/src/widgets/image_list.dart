import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }
}

Widget buildImage(ImageModel image) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
      color: Colors.blueGrey,
    )),
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.all(8),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Image.network(image.url),
        ),
        Text(image.title),
      ],
    ),
  );
}
