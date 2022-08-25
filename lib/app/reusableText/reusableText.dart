import 'package:flutter/material.dart';

class commonText extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final double? size;

  commonText({required this.title, this.fontWeight, this.size});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: size,
        ),
      ),
    );
  }
}