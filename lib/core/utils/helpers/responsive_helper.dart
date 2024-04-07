import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveHelper {
  double setResponsiveWidth({
    SizingInformation? sizingInfo,
    double? defaultWidth,
  }) {
    switch (sizingInfo?.deviceScreenType) {
      case DeviceScreenType.tablet:
        return 500.0;
      case DeviceScreenType.desktop:
        return 600.0;
      default:
        return 340;
    }
  }
}
