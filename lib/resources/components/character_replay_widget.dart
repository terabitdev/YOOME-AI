import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterReplayWidget extends StatelessWidget {
  final List<Map<String, String>> replayOptions;
  final String selectedReplay;
  final Function(String) onReplaySelected;

  const CharacterReplayWidget({
    Key? key,
    required this.replayOptions,
    required this.selectedReplay,
    required this.onReplaySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Character Replay',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          children: replayOptions
              .map((replay) => _buildReplayOption(replay))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildReplayOption(Map<String, String> replay) {
    bool isSelected = selectedReplay == replay['id'];
    bool isFirst = replayOptions.first == replay;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: !isFirst ? 0 : 16.w),
        child: GestureDetector(
          onTap: () => onReplaySelected(replay['id']!),
          child: Container(
            height: 140.h,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF8B5CF6).withOpacity(0.2)
                  : const Color(0xFF374151),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF8B5CF6)
                    : Colors.transparent,
                width: 2.w,
              ),
            ),
            child: Column(
              children: [
                // Chat visualization
                Expanded(
                  child: _buildChatVisualization(replay['id']!, isSelected),
                ),
                SizedBox(height: 12.h),
                Text(
                  replay['title']!,
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFFD1D5DB),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  replay['subtitle']!,
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xFFD1D5DB)
                        : const Color(0xFF9CA3AF),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatVisualization(String replayId, bool isSelected) {
    Color bubbleColor = isSelected
        ? const Color(0xFF8B5CF6)
        : const Color(0xFF4B5563);

    if (replayId == 'interactive_story') {
      // Multiple long messages
      return Column(
        children: [
          // YOOME message
          Row(
            children: [
              Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: bubbleColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'Y',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: bubbleColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              SizedBox(width: 24.w),
              Expanded(
                child: Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: bubbleColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          // User response
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: bubbleColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: bubbleColor.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      // Short casual messages
      return Column(
        children: [
          // YOOME message
          Row(
            children: [
              Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: bubbleColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'Y',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 40.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: bubbleColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // User response
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 50.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: bubbleColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 16.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: bubbleColor.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
