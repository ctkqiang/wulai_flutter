import 'package:flutter/material.dart';
import 'package:wulai/src/utilities/wulai_logger.dart';
import 'package:wulai/src/widgets/wuali_warning.dart';

class WualaiCore {
  static WualaiCore get instance => WualaiCore.create();

  WualaiCore._();
  WualaiCore.create() : this._();

  final logger = WulaiLogger.instance;

  int getTheRemainingDays({
    required DateTime dueDate,
    bool isDeveloperMode = false,
  }) {
    DateTime currentDate = DateTime.now();
    int daysRemaining = dueDate.difference(currentDate).inDays;

    if (isDeveloperMode) {
      logger.info('$runtimeType  getTheRemainingDays: $daysRemaining');
    }

    return daysRemaining;
  }

  double calculateOpacity(int daysRemaining, int deadlineDays) {
    double opacityValue = (deadlineDays + daysRemaining) / deadlineDays;
    if (opacityValue < 0.0) opacityValue = 0.0;

    return opacityValue;
  }

  @pragma('vm:invisible', ['expiry'])
  void onExpiryDateDue(
    BuildContext context, {
    required int daysRemainin,
    void Function()? whenExpiryDoThis,
  }) {
    if (daysRemainin <= 2) {
      if (whenExpiryDoThis == null) {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute<void>(builder: (context) => const WualaiWarning()),
        );
      } else {
        whenExpiryDoThis.call();
      }
    }
  }
}
