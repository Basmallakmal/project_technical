import 'package:flutter/material.dart';
import 'package:project_technical/domain/model/post_model.dart';

class QuestionOneItem extends StatelessWidget {
  final int index;
  final PostModel model;

  const QuestionOneItem({
    super.key,
    required this.index,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(index.toString()),
      margin: EdgeInsets.only(top: index == 0 ? 0 : 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              model.title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
