import 'package:flutter/material.dart';

class DualActionButtons extends StatelessWidget {
  const DualActionButtons({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
    required this.onLeftTap,
    required this.onRightTap,
    this.leftIsPrimary = false,
    this.height = 48,
    this.cornerRadius = 30,
  });

  final String leftLabel;
  final String rightLabel;
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;

  /// If *true* the left button becomes filled and the right one outlined.
  final bool leftIsPrimary;

  final double height;
  final double cornerRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = Color.fromARGB(255, 114, 69, 187);
    final overlayColor = primaryColor.withOpacity(0.08);

    Widget _buildFilled(String text, VoidCallback onTap) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          minimumSize: Size.fromHeight(height),
        ),
        onPressed: onTap,
        child: Text(text),
      );
    }

    Widget _buildOutlined(String text, VoidCallback onTap) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(
            color: const Color.fromARGB(255, 161, 138, 226).withOpacity(.3),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          minimumSize: Size.fromHeight(height),
          overlayColor: Colors.white.withOpacity(.1),
        ),
        onPressed: onTap,
        child: Text(text),
      );
    }

    final leftButton = leftIsPrimary
        ? _buildFilled(leftLabel, onLeftTap)
        : _buildOutlined(leftLabel, onLeftTap);

    final rightButton = leftIsPrimary
        ? _buildOutlined(rightLabel, onRightTap)
        : _buildFilled(rightLabel, onRightTap);

    return Row(
      children: [
        Expanded(child: leftButton),
        const SizedBox(width: 12),
        Expanded(child: rightButton),
      ],
    );
  }
}
