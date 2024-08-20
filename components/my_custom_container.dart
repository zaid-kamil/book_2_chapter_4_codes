// components/my_custom_container.dart
import 'package:flutter/material.dart';

class MyCustomContainer extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double height;
  final double width;

  // constructor
  const MyCustomContainer({
    super.key,
    required this.title,
    required this.imageUrl,
    this.height = 500,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // decoration to add image and text
      decoration: BoxDecoration(
        // image decoration adds image to the container
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          // color filter to darken the image
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      // alignment to center the text
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          // text styling
          style: const TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
