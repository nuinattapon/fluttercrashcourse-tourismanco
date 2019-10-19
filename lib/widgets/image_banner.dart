import 'package:flutter/material.dart';
// import '../models/global.dart';

class ImageBanner extends StatelessWidget {
  // const ImageBanner({Key key}) : super(key: key);
  final String assetPath;
  final double height;
  ImageBanner({this.assetPath, this.height = 200.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: height,
        // width: double.infinity,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
