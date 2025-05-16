import 'package:flutter/material.dart';

import 'state.dart';

class QuestionThreeProvider extends ChangeNotifier {
  final state = QuestionThreeState();

  void resetState() {
    state.count = 0;
    notifyListeners();
  }

  void increment() {
    state.count++;
    notifyListeners();
  }

  void decrement() {
    if (state.count > 0) {
      state.count--;
      notifyListeners();
    }
  }
}
