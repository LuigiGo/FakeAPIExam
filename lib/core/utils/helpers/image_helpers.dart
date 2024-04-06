import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../const/image_const.dart';

class ImageHelpers {
  Widget loadNetworkImage({String? imgUrl, String? placeholder}) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imgUrl ?? '',
        placeholder: (context, url) => const Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) {
          return SizedBox(
            width: 50.0,
            height: 50.0,
            child: Image.asset(
              placeholder ?? ImageConst.defaultImagePlaceholder,
            ),
          );
        },
      ),
    );
  }
}
