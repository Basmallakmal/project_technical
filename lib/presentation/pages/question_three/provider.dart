import 'package:flutter/material.dart';

import 'state.dart';

class QuestionThreeProvider extends ChangeNotifier {
  final state = QuestionThreeState();

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
