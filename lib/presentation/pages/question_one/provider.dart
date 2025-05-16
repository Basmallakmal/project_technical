import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:project_technical/config/multilanguage/language_value.dart';
import 'package:project_technical/config/session/app_sesion.dart';
import 'package:project_technical/domain/controller/post_controller.dart';
import 'package:project_technical/domain/model/api_response.dart';
import 'package:project_technical/domain/model/list_reponse_model.dart';
import 'package:project_technical/domain/model/post_model.dart';
import 'package:project_technical/presentation/pages/home/provider.dart';
import 'package:project_technical/presentation/utils/app_services.dart';
import 'package:project_technical/presentation/utils/show_scaffold_msg.dart';
import 'package:provider/provider.dart';

import 'state.dart';

class QuestionOneProvider extends ChangeNotifier {
  final state = QuestionOneState();

  /// PAGING STATE
  void resetState() {
    state.pagingState = PagingState();
    state.isLoading = false;
    notifyListeners();
  }

  refreshData() {
    state.pagingState = state.pagingState.reset();
    notifyListeners();
  }

  appendPage({
    required int pageKey,
    required List<PostModel> itemList,
    required bool hasNextPage,
    bool saveToCache = true,
  }) async {
    state.pagingState = state.pagingState.copyWith(
      pages: [...?state.pagingState.pages, itemList],
      keys: [...?state.pagingState.keys, pageKey],
      hasNextPage: hasNextPage,
      isLoading: false,
    );
    notifyListeners();

    if (saveToCache) {
      // save to cache
      PostController().fillCachePosts(state.pagingState.items ?? []);
    }
  }

  appendError({required String error}) {
    state.pagingState = state.pagingState.copyWith(
      error: error,
      isLoading: false,
    );
    notifyListeners();
  }

  /// FUNCTION
  void getPostData() async {
    // Check if the current page is loading
    if (state.pagingState.isLoading) return;
    state.pagingState = state.pagingState.copyWith(
      isLoading: true,
      error: null,
    );
    notifyListeners();

    try {
      var page = (state.pagingState.keys?.last ?? 0) + 1;
      ApiResponse<ListResponseModel<PostModel>> data =
          await PostController().getPosts(path: getAPIPath());

      appendPage(
        pageKey: page,
        itemList: data.data?.data ?? [],
        hasNextPage: false,
      );
    } catch (err) {
      String error = err.toString();
      // Check if the user is connected to the internet
      getCachePostData();
      appendError(error: error);
      notifyListeners();
    }
  }

  void getCachePostData() {
    bool isConnected = AppServices.context
        .read<HomeProvider>()
        .state
        .isConnected; //  get isConnected from home provider
    if (isConnected || state.fetchStatus == FetchStatus.error) return;
    List<PostModel> cachedData = PostController().getCachePosts();
    var page = (state.pagingState.keys?.last ?? 0) + 1;
    appendPage(
      pageKey: page,
      itemList: cachedData,
      hasNextPage: false,
      saveToCache: false,
    );
    showScaffoldMessage(
        context: AppServices.context,
        message: LanguageValue.no_connection_get_data);
  }

  // Fetch status
  String getAPIPath() {
    switch (state.fetchStatus) {
      case FetchStatus.success:
        return state.apiPathSuccess;
      case FetchStatus.error:
        return state.apiPathError;
    }
  }

  void updateFetchStatus(FetchStatus status) {
    if (state.pagingState.isLoading) return;
    state.fetchStatus = status;
    notifyListeners();
    refreshData();
  }
}
