import 'package:flutter/material.dart';

import '../../const/image_const.dart';

class ImageHelpers {
  Widget loadImage({
    String? imgUrl,
    String? placeholder,
    double? width,
    double? height,
  }) {
    String defaultPlaceholder = placeholder ?? ImageConst.kAssetProfile;
    return FadeInImage(
      width: width,
      height: height,
      image: NetworkImage(imgUrl ?? ''),
      placeholder: AssetImage(defaultPlaceholder),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(
          defaultPlaceholder,
          width: width,
          height: height,
        );
      },
    );
  }
}
