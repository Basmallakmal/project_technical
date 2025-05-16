import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class HomeState {
  StreamSubscription<InternetStatus>? internetStatusSubscription;
  bool isConnected = true;
}
