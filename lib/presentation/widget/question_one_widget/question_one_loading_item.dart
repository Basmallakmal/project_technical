import 'package:flutter/material.dart';
import 'package:project_technical/presentation/utils/custom_shimmer.dart';

class QuestionOneLoadingItem extends StatelessWidget {
  final int index;

  const QuestionOneLoadingItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(index.toString()),
      margin: EdgeInsets.only(top: index == 0 ? 0 : 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: CustomShimmerWidget.rectangular(
        height: 70,
      ),
    );
  }
}
