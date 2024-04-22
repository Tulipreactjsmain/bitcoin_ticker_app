import 'dart:async';

Timer? _debounce;

void debounce(Function() callback, Duration duration) {
  if (_debounce?.isActive ?? false) _debounce?.cancel();
  _debounce = Timer(duration, callback);
}

void onChangedCallback(int selectedIndex) {
  debounce(() {
  }, const Duration(milliseconds: 500));
}
