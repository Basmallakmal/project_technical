
import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';

class ErrorPage extends StatelessWidget {
  final String subtitle;
  final Function()? onRetryTap;

  const ErrorPage({
    super.key,
    required this.subtitle,
    required this.onRetryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline_rounded, size: 100),
          SizedBox(height: 16),
          Text(
            LanguageValue.something_went_wrong,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 16),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onRetryTap,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                LanguageValue.retry,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}