import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterPreferencesWidget extends StatelessWidget {
  final List<Map<String, String>> characterOptions;
  final String selectedCharacter;
  final Function(String) onCharacterSelected;

  const CharacterPreferencesWidget({
    Key? key,
    required this.characterOptions,
    required this.selectedCharacter,
    required this.onCharacterSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Character Preferences',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          children: characterOptions
              .map((character) => _buildCharacterOption(character))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildCharacterOption(Map<String, String> character) {
    bool isSelected = selectedCharacter == character['id'];
    bool isFirst = characterOptions.first == character;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: !isFirst ? 0 : 16.w),
        child: GestureDetector(
          onTap: () => onCharacterSelected(character['id']!),
          child: Column(
            children: [
              Container(
                height: 200.h,
                width: 200.w,
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF8B5CF6)
                        : Colors.transparent,
                    width: 3.w,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: character['image'] != null
                      ? Image.asset(
                          character['image']!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFF8B5CF6),
                              child: Icon(
                                character['id'] == 'male'
                                    ? Icons.man
                                    : Icons.woman,
                                color: Colors.white,
                                size: 80.sp,
                              ),
                            );
                          },
                        )
                      : Container(
                          color: const Color(0xFF8B5CF6),
                          child: Icon(
                            character['id'] == 'male' ? Icons.man : Icons.woman,
                            color: Colors.white,
                            size: 80.sp,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                character['label']!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
