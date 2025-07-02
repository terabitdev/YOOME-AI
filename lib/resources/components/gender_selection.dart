// gender_selection_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelectionWidget extends StatelessWidget {
  final List<Map<String, String>> genderOptions;
  final String selectedGender;
  final Function(String) onGenderSelected;

  const GenderSelectionWidget({
    Key? key,
    required this.genderOptions,
    required this.selectedGender,
    required this.onGenderSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Gender',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16.h),
        ...genderOptions.map((option) => _buildGenderOption(option)).toList(),
      ],
    );
  }

  Widget _buildGenderOption(Map<String, String> option) {
    bool isSelected = selectedGender == option['id'];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => onGenderSelected(option['id']!),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF8B5CF6).withOpacity(0.2)
                : const Color(0xFF3F3F46),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isSelected ? const Color(0xFF8B5CF6) : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              option['image'] != null && option['image']!.isNotEmpty
                  ? Image.asset(
                      option['image']!,
                      height: 24.h,
                      width: 24.w,
                      color: isSelected ? const Color(0xFF8B5CF6) : Colors.grey,
                    )
                  : const SizedBox.shrink(),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  option['label']!,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? const Color(0xFF8B5CF6)
                      : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? const Color(0xFF8B5CF6) : Colors.grey,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white, size: 12)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
