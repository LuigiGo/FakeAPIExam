import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveHelper {
  double setResponsiveWidth({
    SizingInformation? sizingInfo,
    double? defaultWidth,
  }) {
    double responsiveWidth = defaultWidth ?? 360;
    if (sizingInfo?.deviceScreenType == DeviceScreenType.tablet) {
      responsiveWidth = 500.0;
    } else if (sizingInfo?.deviceScreenType == DeviceScreenType.desktop) {
      responsiveWidth = 600;
    }
    return responsiveWidth;
  }
}
