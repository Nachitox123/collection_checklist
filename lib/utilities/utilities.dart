import 'package:cached_network_image/cached_network_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '/widgets/custom_widgets.dart';
import '/pages/pages.dart';

// Allows to see a picture in the whole screen.
class ImageViewPage extends StatelessWidget {
  const ImageViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Collection Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Go back to the previous page
          },
          child: CachedNetworkImage(
            imageUrl: 'https://picsum.photos/seed/767/600',
            placeholder: (context, url) => const CircularProgressIndicator(),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ImageViewPage(),
    );
  }
}