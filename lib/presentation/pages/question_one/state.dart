import 'dart:async';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:project_technical/domain/model/post_model.dart';

class QuestionOneState {
  bool isLoading = false;
  bool isConnected = true;

  PagingState<int, PostModel> pagingState = PagingState();
  StreamSubscription<InternetStatus>? internetStatusSubscription;
}
