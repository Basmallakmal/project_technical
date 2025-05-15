import 'package:flutter/material.dart';

class QuestionTwoState {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();

  String fullname = '';
  String email = '';
}
