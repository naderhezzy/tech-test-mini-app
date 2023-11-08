import 'package:f1_ranking/config/app_config.dart';
import 'package:f1_ranking/constants.dart';

// Methods to set responsive height and width

/// Returns a calculated height relative to the device's
/// height based on the input fraction [height]
double setHeight(double height) {
  final ratio = height / kDesignDraftHeight;
  return ratio * globalContext!.height;
}

/// Returns a calculated height relative to the device's
/// width based on the input fraction [width]
double setWidth(double width) {
  final ratio = width / kDesignDraftWidth;
  return ratio * globalContext!.width;
}
