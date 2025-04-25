import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  Future<T> run<T>(Future<T> Function() action) {
    _timer?.cancel();
    final completer = Completer<T>();

    _timer = Timer(Duration(milliseconds: milliseconds), () async {
      final result = await action();
      completer.complete(result);
    });

    return completer.future;
  }
}

