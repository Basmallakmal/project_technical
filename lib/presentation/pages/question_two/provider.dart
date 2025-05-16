import 'package:flutter/material.dart';

import 'state.dart';

class QuestionTwoProvider extends ChangeNotifier {
  final state = QuestionTwoState();

  void resetState() {
    state.isLoading = false;
    state.fullnameController.clear();
    state.emailController.clear();
    state.fullname = '';
    state.email = '';
    notifyListeners();
  }

  void setData() {
    state.fullname = state.fullnameController.text;
    state.email = state.emailController.text;
    notifyListeners();
  }

  @override
  void dispose() {
    state.fullnameController.dispose();
    state.emailController.dispose();
    super.dispose();
  }
}
