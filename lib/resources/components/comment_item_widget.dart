// Reusable Comment Item Widget
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentItem extends StatelessWidget {
  final String userAvatar;
  final String username;
  final String timeAgo;
  final String comment;
  final String likes;

  const CommentItem({
    Key? key,
    required this.userAvatar,
    required this.username,
    required this.timeAgo,
    required this.comment,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User Avatar
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
          child: ClipOval(
            child: Image.asset(
              userAvatar,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade600,
                  child: Icon(Icons.person, color: Colors.white, size: 16),
                );
              },
            ),
          ),
        ),
        SizedBox(width: 12.w),

        // Comment Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    timeAgo,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'Reply',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              if (comment.isNotEmpty) ...[
                SizedBox(height: 4.h),
                Text(
                  comment,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
              ],
            ],
          ),
        ),

        // Like Section
        Column(
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.white.withOpacity(0.6),
              size: 16,
            ),
            SizedBox(height: 2.h),
            Text(
              likes,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
