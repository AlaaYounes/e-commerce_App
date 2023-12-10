import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  String image;

  ProductImages({required this.image});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl: image!,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
