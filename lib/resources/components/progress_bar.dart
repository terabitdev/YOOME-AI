// progress_bar_widget.dart
import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  
  const ProgressBarWidget({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: List.generate(totalSteps, (index) {
          bool isActive = index < currentStep;
          bool isCurrent = index == currentStep - 1;
          
          return Expanded(
            child: Container(
              height: 4,
              margin: EdgeInsets.only(right: index < totalSteps - 1 ? 8 : 0),
              decoration: BoxDecoration(
                color: isActive || isCurrent 
                    ? const Color(0xFF8B5CF6) 
                    : const Color(0xFF374151),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }
}