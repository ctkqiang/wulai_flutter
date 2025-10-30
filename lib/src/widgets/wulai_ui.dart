import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wulai_flutter/src/core/wulai_core.dart';

/// A Flutter widget that manages and displays warnings based on an expiry date.
///
/// This widget wraps its [child] and, upon rendering, checks if a specified
/// [dueDate] has passed. If the due date is approaching or has passed, it can
/// trigger a custom action defined by [whenExpiryDoThis].
///
/// English:
/// A Flutter widget that manages and displays warnings based on an expiry date.
/// This widget wraps its [child] and, upon rendering, checks if a specified
/// [dueDate] has passed. If the due date is approaching or has passed, it can
/// trigger a custom action defined by [whenExpiryDoThis].
///
/// 中文:
/// 一个Flutter小部件，根据过期日期管理和显示警告。
/// 这个小部件包裹其 [child]，并在渲染时检查指定的 [dueDate] 是否已过。
/// 如果截止日期临近或已过，它可以触发由 [whenExpiryDoThis] 定义的自定义操作。
///
/// Deutsch:
/// Ein Flutter-Widget, das Warnungen basierend auf einem Ablaufdatum verwaltet und anzeigt.
/// Dieses Widget umschließt sein [child] und prüft beim Rendern, ob ein angegebenes
/// [dueDate] überschritten wurde. Wenn das Fälligkeitsdatum naht oder überschritten wurde,
/// kann es eine benutzerdefinierte Aktion auslösen, die durch [whenExpiryDoThis] definiert ist.
@immutable
class Wulai extends StatefulWidget {
  /// The widget below this widget in the tree.
  ///
  /// English:
  /// The widget below this widget in the tree.
  ///
  /// 中文:
  /// 树中位于此小部件下方的小部件。
  ///
  /// Deutsch:
  /// Das Widget unter diesem Widget im Baum.
  final Widget child;

  /// The date by which an action is considered due.
  ///
  /// English:
  /// The date by which an action is considered due.
  ///
  /// 中文:
  /// 截止日期，在此日期之前应完成某个操作。
  ///
  /// Deutsch:
  /// Das Datum, bis zu dem eine Aktion als fällig gilt.
  final DateTime dueDate;

  /// The number of days before the [dueDate] to start displaying warnings or taking action.
  ///
  /// English:
  /// The number of days before the [dueDate] to start displaying warnings or taking action.
  ///
  /// 中文:
  /// 在 [dueDate] 之前的多少天开始显示警告或采取行动。
  ///
  /// Deutsch:
  /// Die Anzahl der Tage vor dem [dueDate], an denen Warnungen angezeigt oder Maßnahmen ergriffen werden sollen.
  final int deadlineDays;

  /// An optional callback function that is executed when the expiry date is due.
  /// If not provided, a default warning UI might be displayed.
  ///
  /// English:
  /// An optional callback function that is executed when the expiry date is due.
  /// If not provided, a default warning UI might be displayed.
  ///
  /// 中文:
  /// 当过期日期到来时执行的可选回调函数。
  /// 如果未提供，可能会显示默认的警告UI。
  ///
  /// Deutsch:
  /// Eine optionale Callback-Funktion, die ausgeführt wird, wenn das Ablaufdatum fällig ist.
  /// Wenn nicht angegeben, wird möglicherweise eine Standard-Warn-UI angezeigt.
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
