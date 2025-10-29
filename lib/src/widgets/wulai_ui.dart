import 'package:flutter/material.dart';
import 'package:wulai/src/core/wulai_core.dart';

class Wulai extends StatefulWidget {
  final Widget child;
  final DateTime dueDate;
  final int deadlineDays;

  const Wulai({
    super.key,
    required this.child,
    required this.dueDate,
    required this.deadlineDays,
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
    return Opacity(
      opacity: wulai.calculateOpacity(
        wulai.getTheRemainingDays(dueDate: widget.dueDate),
        widget.deadlineDays,
      ),
      child: widget.child,
    );
  }
}
