import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A single pill inside a segmented-control row.
///
/// ```dart
/// Row(
///   children: [
///     SegmentedTabButton(
///       title: 'Current',
///       isSelected: selected == 'Current',
///       isFirst: true,
///       onTap: () => setState(() => selected = 'Current'),
///     ),
///     SegmentedTabButton(
///       title: 'Upcoming',
///       isSelected: selected == 'Upcoming',
///       onTap: () => setState(() => selected = 'Upcoming'),
///     ),
///     SegmentedTabButton(
///       title: 'Previous',
///       isSelected: selected == 'Previous',
///       isLast: true,
///       onTap: () => setState(() => selected = 'Previous'),
///     ),
///   ],
/// )
/// ```
class SegmentedTabButton extends StatelessWidget {
  const SegmentedTabButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.isFirst = false,
    this.isLast = false,
    this.radius = 25,
    this.selectedColor = const Color(0xFFA259FF),
    this.textStyle,
    this.unselectedOpacity = .6,
    this.verticalPadding = 12,
    required bool isMiddle,
  });

  /// Label text.
  final String title;

  /// Whether the tab is currently selected (parent‑controlled).
  final bool isSelected;

  /// Callback when tapped.
  final VoidCallback onTap;

  /// Marks the first / last tab in the row so we can round corners.
  final bool isFirst;
  final bool isLast;

  /* Styling */
  final double radius;
  final Color selectedColor;
  final double unselectedOpacity;
  final double verticalPadding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    // Decide border radii based on position + selection.
    BorderRadius borderRadius;
    if (isSelected) {
      borderRadius = BorderRadius.circular(radius);
    } else if (isFirst) {
      borderRadius = BorderRadius.only(
        topLeft: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
      );
    } else if (isLast) {
      borderRadius = BorderRadius.only(
        topRight: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      );
    } else {
      borderRadius = BorderRadius.zero;
    }

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: verticalPadding.h),
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : Colors.transparent,
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Text(
              title,
              style:
                  textStyle ??
                  TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Colors.white.withOpacity(unselectedOpacity),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
