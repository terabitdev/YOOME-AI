import 'package:flutter/material.dart';

class CustomToggleSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomToggleSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: const Color(0xFFFFFFFF),
      activeTrackColor: const Color(0xFFA259FF).withOpacity(0.3),
      inactiveThumbColor: const Color(0xFFFFFFFF),
      inactiveTrackColor: const Color(0xFFA259FF),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
