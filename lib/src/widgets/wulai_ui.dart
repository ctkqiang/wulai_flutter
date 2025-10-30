import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wulai/src/core/wulai_core.dart';

@immutable
class Wulai extends StatefulWidget {
  final Widget child;
  final DateTime dueDate;
  final int deadlineDays;

  final void Function()? whenExpiryDoThis;

  const Wulai({
    super.key,
    required this.child,
    required this.dueDate,
    required this.deadlineDays,
    this.whenExpiryDoThis,
  });

  @override
  State<Wulai> createState() => _WulaiState();
}

class _WulaiState extends State<Wulai> {
  final wulai = WualaiCore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext innerContext) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          wulai.onExpiryDateDue(
            innerContext,
            daysRemainin: wulai.getTheRemainingDays(
              dueDate: widget.dueDate,
              isDeveloperMode: kDebugMode,
            ),
            whenExpiryDoThis: widget.whenExpiryDoThis,
          );
        });
        return widget.child;
      },
    );
  }
}
