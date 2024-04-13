import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DrawerImage extends StatelessWidget {
  const DrawerImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: ((context, url, error) {
        return const Text("");
      }),
      height: 100,
    );
  }
}
