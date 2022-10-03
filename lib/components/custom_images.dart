import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

class SVGAssertsImages extends StatelessWidget {
  const SVGAssertsImages({
    Key? key,
    required this.imageName,
  }) : super(key: key);
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$imageName.svg',
    );
  }
}

//https://picsum.photos/id/1/200/300

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.fit,
  }) : super(key: key);
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const SkeletonAvatar();
      },
    );
  }
}

class NetworkCicularImage extends StatelessWidget {
  const NetworkCicularImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.fit,
  }) : super(key: key);
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45),
      child: Image.network(
        imageUrl,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const SkeletonAvatar();
        },
      ),
    );
  }
}
