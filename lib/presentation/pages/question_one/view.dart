import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:project_technical/domain/model/post_model.dart';
import 'package:project_technical/presentation/pages/question_one/state.dart';
import 'package:project_technical/presentation/widget/error_page.dart';
import 'package:project_technical/presentation/widget/question_one_widget/question_one_item.dart';
import 'package:project_technical/presentation/widget/question_one_widget/question_one_loading_item.dart';
import 'package:provider/provider.dart';

import '../../../config/theme/theme.dart';
import 'provider.dart';

@RoutePage()
class QuestionOnePage extends StatefulWidget {
  const QuestionOnePage({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionOnePageState();
}

class _QuestionOnePageState extends State<QuestionOnePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _loadingWidget() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder: (_, index_) => QuestionOneLoadingItem(index: index_),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<QuestionOneProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LanguageValue.question_1),
            elevation: 2,
          ),
          body: LoadingOverlay(
            isLoading: provider.state.isLoading,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LanguageValue.question_1_desc,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    LanguageValue.choose_api_status,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  // create radio button group from FetchStatus enum
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...FetchStatus.values.map((status) {
                        return Column(
                          children: [
                            Radio<FetchStatus>(
                              value: status,
                              groupValue: provider.state.fetchStatus,
                              onChanged: (value) {
                                provider.updateFetchStatus(value!);
                              },
                            ),
                            Text(status.name),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => Future.sync(() => provider.refreshData()),
                    child: PagedListView<int, PostModel>(
                      state: provider.state.pagingState,
                      fetchNextPage: provider.getPostData,
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      builderDelegate: PagedChildBuilderDelegate<PostModel>(
                        itemBuilder: (context, item, index) => QuestionOneItem(
                          index: index,
                          model: item,
                        ),
                        firstPageErrorIndicatorBuilder: (context) => ErrorPage(
                          subtitle: provider.state.pagingState.error.toString(),
                          onRetryTap: () {
                            provider.refreshData();
                          },
                        ),
                        firstPageProgressIndicatorBuilder: (context) =>
                            _loadingWidget(),
                        noItemsFoundIndicatorBuilder: (context) =>
                            Center(child: Text(LanguageValue.empty_data)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              provider.refreshData();
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(Icons.refresh_rounded),
          ),
        );
      },
    );
  }
}
