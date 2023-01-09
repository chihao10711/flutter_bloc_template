import "package:flutter/material.dart";
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  const ShimmerWidget({Key? key, this.height, this.width, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade50,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius,
          ),
        ),
      );
}
