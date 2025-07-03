import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';

class AgeSelectionWidget extends StatelessWidget {
  final List<String> ageOptions;
  final String selectedAge;
  final Function(String) onAgeSelected;

  const AgeSelectionWidget({
    Key? key,
    required this.ageOptions,
    required this.selectedAge,
    required this.onAgeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Age', style: GenderTwextStyle14500),
        SizedBox(height: 16.h),
        Row(children: ageOptions.map((age) => _buildAgeOption(age)).toList()),
      ],
    );
  }

  Widget _buildAgeOption(String age) {
    bool isSelected = selectedAge == age;
    bool isFirst = ageOptions.first == age;
    bool isLast = ageOptions.last == age;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: !isLast ? 8 : 0, left: !isFirst ? 4 : 0),
        child: GestureDetector(
          onTap: () => onAgeSelected(age),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              // color: isSelected
              //     ? const Color(0xFF8B5CF6)
              //     : const Color(0xFF4C1D95).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF8B5CF6)
                    : const Color(0xFF6B46C1).withOpacity(0.5),
                width: 2.w,
              ),
            ),
            child: Center(
              child: Text(
                age,
                style: GoogleFonts.outfit(
                  color: isSelected ? Colors.white : const Color(0xFFD1D5DB),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
