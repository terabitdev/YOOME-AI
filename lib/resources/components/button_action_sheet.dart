import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

/// Represents a single action in the sheet
class SheetAction {
  SheetAction({
    required this.label,
    required this.onTap,
    this.leading,
    this.flex = 1,
  });

  final String label;
  final VoidCallback onTap;
  final Widget? leading;
  final int flex; // for flexible sizing in grouped rows
}

/// Represents a row containing multiple actions (side-by-side)
class SheetActionGroup {
  SheetActionGroup(this.actions);

  final List<SheetAction> actions;
}

/// Reusable ActionSheet for use anywhere
class ActionSheet extends StatelessWidget {
  const ActionSheet({
    super.key,
    required this.title,
    required this.items,
    this.sheetColor = Colors.black,
    this.cardColor = const Color(0xFF2D1B5B),
    this.strokeColor = const Color.fromARGB(255, 121, 73, 167),
  });

  final String title;
  final List<dynamic> items; // SheetAction or SheetActionGroup
  final Color sheetColor;
  final Color cardColor;
  final Color strokeColor;

  /// Helper method to show the sheet from anywhere
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required List<dynamic> items,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => ActionSheet(title: title, items: items),
    );
  }

  @override
  Widget build(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: sheetColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          border: Border.all(color: strokeColor.withOpacity(0.5), width: 1.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag Handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title & Actions
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: VTPSTextStyle145005),
                  const SizedBox(height: 20),

                  for (final item in items) ...[
                    if (item is SheetAction)
                      _ActionRow(
                        label: item.label,
                        leading: item.leading,
                        cardColor: cardColor,
                        strokeColor: strokeColor,
                        onTap: () {
                          Navigator.pop(ctx);
                          item.onTap();
                        },
                      )
                    else if (item is SheetActionGroup)
                      Row(
                        children: item.actions.asMap().entries.map((entry) {
                          final index = entry.key;
                          final action = entry.value;
                          return Expanded(
                            flex: action.flex,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: index < item.actions.length - 1
                                    ? 8.w
                                    : 0,
                              ),
                              child: _ActionRow(
                                label: action.label,
                                leading: action.leading,
                                cardColor: cardColor,
                                strokeColor: strokeColor,
                                onTap: () {
                                  Navigator.pop(ctx);
                                  action.onTap();
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Single action row widget
class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.label,
    required this.onTap,
    required this.leading,
    required this.cardColor,
    required this.strokeColor,
  });

  final String label;
  final VoidCallback onTap;
  final Widget? leading;
  final Color cardColor;
  final Color strokeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: cardColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: strokeColor.withOpacity(0.5)),
        ),
        child: Row(
          children: [
            if (leading != null) ...[leading!, SizedBox(width: 12.w)],
            Expanded(child: Text(label, style: VTPSTextStyle124006)),
            Icon(Icons.chevron_right, color: Colors.white.withOpacity(0.6)),
          ],
        ),
      ),
    );
  }
}
