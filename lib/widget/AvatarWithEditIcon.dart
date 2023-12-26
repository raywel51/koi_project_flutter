import 'package:flutter/material.dart';

class AvatarWithEditIcon extends StatelessWidget {
  final String imageUrl; // Input URL for the image

  const AvatarWithEditIcon({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        children: [
          Container(
            width: 260, // Adjust the size of the entire circle (including the border)
            height: 260, // Adjust the size of the entire circle (including the border)
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.purple.shade200, // Border color
                width: 10, // Border width
              ),
            ),
            child: CircleAvatar(
              radius: 250, // Adjust the size of the image inside the border
              backgroundColor: Colors.transparent, // Set a transparent background
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          Positioned(
            bottom: 19,
            right: 19,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(220),
                color: Colors.purple.shade200, // Change this to your desired color
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
