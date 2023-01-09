import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/share/share.dart';
import 'base_widgets.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  const CachedImageWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: borderRadius,
        child: SizedBox(
          width: width,
          height: height,
          child: CachedNetworkImage(
            fit: fit,
            imageUrl: imageUrl,
            placeholder: _placeholder,
            errorWidget: _errorWidget,
          ),
        ),
      );

  Widget _placeholder(context, url) => ShimmerWidget(
        width: width,
        height: height,
        borderRadius: borderRadius,
      );

  Widget _errorWidget(BuildContext context, String url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: const Color(0xFFA5A6AE).withOpacity(0.1),
        ),
        child: Center(
          child: Icon(
            Icons.error_outline,
            color: context.theme.errorColor,
          ),
        ),
      );
}
