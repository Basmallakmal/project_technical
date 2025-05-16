import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:project_technical/config/network/networking.dart';
import 'package:project_technical/domain/model/post_model.dart';

enum FetchStatus {
  success,
  error,
}

class QuestionOneState {
  bool isLoading = false;
  bool isConnected = true;

  PagingState<int, PostModel> pagingState = PagingState();
  StreamSubscription<InternetStatus>? internetStatusSubscription;
  final String apiPathSuccess = ApiConstant.getPost;
  final String apiPathError = "${ApiConstant.getPost}ss";

  FetchStatus fetchStatus = FetchStatus.success;
}
