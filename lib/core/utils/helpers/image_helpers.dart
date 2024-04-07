import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../const/image_const.dart';

class ImageHelpers {
  Widget loadImage({
    String? imgUrl,
    String? placeholder,
    double? width,
    double? height,
  }) {
    return FadeInImage(
      height: 50,
      width: 50,
      image: NetworkImage(imgUrl ?? ''),
      placeholder: const AssetImage(
        ImageConst.defaultImagePlaceholder,
      ),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(
          ImageConst.defaultImagePlaceholder,
          height: 50,
          width: 50,
        );
      },
    );
    // return ClipOval(
    //   child: CachedNetworkImage(
    //     imageUrl: imgUrl ?? '',
    //     placeholder: (context, url) => const Center(
    //       child: SizedBox(
    //         width: 30.0,
    //         height: 30.0,
    //         child: CircularProgressIndicator(),
    //       ),
    //     ),
    //     errorWidget: (context, url, error) {
    //       return SizedBox(
    //         width: width ?? 50.0,
    //         height: height ?? 50.0,
    //         child: Icon(Icons.person),
    //       );
    //     },
    //   ),
    // );
  }
}
