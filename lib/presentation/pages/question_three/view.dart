import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:project_technical/presentation/pages/question_three/provider.dart';
import 'package:provider/provider.dart';

import '../../../config/theme/theme.dart';

@RoutePage()
class QuestionThreePage extends StatefulWidget {
  const QuestionThreePage({super.key});

  @override
  State<StatefulWidget> createState() => QuestionThreePageState();
}

class QuestionThreePageState extends State<QuestionThreePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<QuestionThreeProvider>().resetState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<QuestionThreeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LanguageValue.question_3),
            elevation: 2,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageValue.question_3_desc,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 32),
                  Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      child: Text(
                        provider.state.count.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: [
                      FilledButton(
                        onPressed: () {
                          provider.decrement();
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.error,
                          iconSize: 32,
                          minimumSize: Size(60, 60),
                        ),
                        child: Icon(
                          Icons.remove,
                        ),
                      ),
                      FilledButton(
                        onPressed: () {
                          provider.increment();
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          iconSize: 32,
                          minimumSize: Size(60, 60),
                        ),
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
