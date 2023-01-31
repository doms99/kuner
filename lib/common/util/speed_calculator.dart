enum Speed {
  slow,
  fast,
  ludicrous;

  double get milliseconds {
    switch (this) {
      case Speed.slow:
        return 125;
      case Speed.fast:
        return 25;
      case Speed.ludicrous:
        return 0;
    }
  }
}

class SpeedCalculator {
  DateTime? last;

  Speed click({double multiplier = 1}) {
    final now = DateTime.now();
    final timeFromLast = now.millisecondsSinceEpoch - (last?.millisecondsSinceEpoch ?? 0);
    last = now;

    if (timeFromLast / multiplier >= Speed.slow.milliseconds) {
      return Speed.slow;
    } else if (timeFromLast / multiplier >= Speed.fast.milliseconds) {
      return Speed.fast;
    } else {
      return Speed.ludicrous;
    }
  }

  void reset() {
    last = null;
  }
}
