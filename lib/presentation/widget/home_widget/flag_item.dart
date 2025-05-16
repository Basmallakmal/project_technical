import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:project_technical/presentation/utils/hexagon_clipper.dart';

class FlagItem extends StatelessWidget {
  final Function()? onTap;
  final String flagImage;
  final String flagText;
  final bool isSelected;

  const FlagItem({
    super.key,
    required this.onTap,
    required this.flagImage,
    required this.flagText,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: isSelected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.2)
            : Colors.transparent,
        child: InkWell(
          onTap: isSelected ? null : onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipPath(
                  clipper: HexagonClipper(),
                  child: Image.asset(
                    flagImage,
                    width: 60,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                AutoSizeText(
                  flagText,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  minFontSize: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
