part of '../../../modules.dart';

/// เมธอดและตัวแปรของบอร์ดรับซื้อ PO
mixin PoBoardMixin {
  final _items = ValueNotifier(const Iterable<PoBoardItemData>.empty());
  final _amountCounters = <PoBoardItemData, ValueNotifier<double>>{};
  final _countdownTimers = <PoBoardItemData, ValueNotifier<Duration>>{};
  final _itemAttachedButtonsEnabled = <PoBoardItemData, ValueNotifier<bool>>{};
  bool _areCountdownTimersRunning = false;

  /// รายการรับซื้อที่มีในระบบ
  Iterable<PoBoardItemData> get poBoardItems => _items.value;

  /// ถอนทรัพยากรในบอร์ดรับซื้อ PO
  void disposeAllPoBoardResources() {
    _areCountdownTimersRunning = false;

    for (final d in _amountCounters.values) {
      d.dispose();
    }

    for (final c in _countdownTimers.values) {
      c.dispose();
    }

    for (final b in _itemAttachedButtonsEnabled.values) {
      b.dispose();
    }

    _items.dispose();
  }

  /// ดึงรายการรับซื้อที่มีอยู่ในระบบทั้งหมด
  Future retrievePoBoardList({void Function()? onSuccessful, void Function()? onFailed});

  /// จำนวนรับส่งปัจจุบัน
  double? getCurrentReceivingAmountOf(PoBoardItemData item) => _amountCounters[item]?.value;

  /// ระยะเวลาที่เหลือจนถึงวันสิ้นสุด
  Duration? getCoundownTimerOf(PoBoardItemData item) => _countdownTimers[item]?.value;

  /// สถานะแสดงปุ่มของรายการรับส่ง
  bool? getItemAttachedButtonEnabledOf(PoBoardItemData item) => _itemAttachedButtonsEnabled[item]?.value;

  /// ตั้งค่าสถานะแสดงปุ่มของแต่ละรายการรับซื้อ
  bool applyEachItemAttachedButtonEnabled(PoBoardItemData item) => true;

  /// แทนที่รายการบอร์ดรับซื้อ PO
  void replacePoBoardList(Iterable<PoBoardItemData> list) {
    final now = DateTime.now();
    for (final e in list) {
      (_amountCounters[e] ??= ValueNotifier(0)).value = e.currentReceivingAmount.clamp(0, e.maximumTotalReceivingAmount);
      final diff = e.expiringDateTime.difference(now);
      final remaining = diff.isNegative ? Duration.zero : diff;
      (_countdownTimers[e] ??= ValueNotifier(remaining)).value = remaining;
      (_itemAttachedButtonsEnabled[e] ??= ValueNotifier(false)).value = applyEachItemAttachedButtonEnabled(e);
    }

    _items.value = list;
  }

  /// อัพเดทนับเวลาถอยหลังของวันสิ้นสุดรายการรับส่ง PO
  void updateCountdownTimers() {
    final now = DateTime.now();

    if (!_areCountdownTimersRunning) return;

    bool hasPositiveDuration = false;

    for (final e in _items.value) {
      final timer = _countdownTimers[e];
      final diff = e.expiringDateTime.difference(now);
      final remaining = diff.isNegative ? Duration.zero : diff;
      hasPositiveDuration = hasPositiveDuration || remaining > Duration.zero;
      if (!_areCountdownTimersRunning) break;

      if (timer == null) {
        _countdownTimers[e] = ValueNotifier(remaining);
        continue;
      }

      if (timer.value.inSeconds != diff.inSeconds) {
        timer.value = remaining;
      }
    }

    _areCountdownTimersRunning = hasPositiveDuration;
  }

  /// อัพเดทปริมาณวัสดุสุงสุดที่สามารถรับซื้อต่อรายการได้
  void updateCurrentReceivingAmountCounters() {
    for (final e in _items.value) {
      _amountCounters[e]?.value = e.currentReceivingAmount.clamp(0, e.maximumTotalReceivingAmount);
    }
  }

  /// อัพเดทการแสดงปุ่มในแต่ละรายการรับซื้อ
  void updateEachItemAttachedButtonEnabled() {
    for (final e in _items.value) {
      _itemAttachedButtonsEnabled[e]?.value = applyEachItemAttachedButtonEnabled(e);
    }
  }

  /// เริ่มตัวนับเวลานับถอยหลังรายการรัับซื้อ
  void startCountdownTimers() {
    if (_areCountdownTimersRunning) return;
    _areCountdownTimersRunning = true;

    Timer.run(_doCountdownTimersLoop);
  }

  /// หยุดตัวนับเวลานับถอยหลังรายการรัับซื้อ
  void stopCountdownTimers() {
    _areCountdownTimersRunning = false;
  }

  void _doCountdownTimersLoop([Duration? _]) {
    updateCountdownTimers();

    if (_areCountdownTimersRunning) Timer.run(_doCountdownTimersLoop);
  }
}
