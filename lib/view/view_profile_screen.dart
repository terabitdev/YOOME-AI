/*  lib/view/view_profile_screen.dart  */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/action_sheet_widget.dart'; // ← your reusable sheet
import 'package:yoome_ai/resources/components/button_action_sheet.dart';
import 'package:yoome_ai/resources/components/comment_item_widget.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/matthew_supports_screen.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});
  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  /* ─────────────  “More” sheet trigger  ───────────── */
  void _showMore() {
    ActionSheet.show(
      context,
      title: 'More',
      items: [
        SheetAction(
          label: 'Share',
          onTap: () {
            /* share logic */
          },
        ),
        SheetAction(
          label: 'Report',
          onTap: () {
            /* report logic */
          },
        ),
      ],
    );
  }

  /* ─────────────────────────── UI ─────────────────────────── */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /* 1️⃣ Background */
          SizedBox.expand(
            child: Image.asset(
              'assets/images/csbackimage.png',
              fit: BoxFit.cover,
            ),
          ),

          /* 2️⃣ Scrollable content  (now receives gestures) */
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height * .40,
                20,
                30,
              ),
              child: const _ProfileContent(),
            ),
          ),

          /* 3️⃣ Toolbar — sits on top, gets taps first */
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            right: 20,
            child: Row(
              children: [
                _toolbarButton(
                  icon: Icons.arrow_back,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                _toolbarButton(icon: Icons.more_vert, onTap: _showMore),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _toolbarButton({
    required IconData icon,
    required VoidCallback onTap,
  }) => Container(
    width: 40.h,
    height: 40.w,
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(.3),
      borderRadius: BorderRadius.circular(12),
    ),
    child: IconButton(
      icon: Icon(icon, color: Colors.white, size: 20),
      onPressed: onTap,
    ),
  );
}

/* ─────────── profile body, comments, etc. ─────────── */

class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('caden', style: VTPSTextStyle205001),
      SizedBox(height: 8.h),
      Text('26.8k Followers @Arianna', style: VTPSTextStyle115002),
      SizedBox(height: 16.h),
      Text(
        'Ypr older brother\'s best friend is cold and rude, '
        'but has a soft spot for you.',
        style: VTPSTextStyle124003,
      ),
      SizedBox(height: 24.h),
      Row(
        children: [
          Expanded(
            child: RoundButton(
              title: 'Chat',
              color: ColorConstants.buttonColor,
              onTap: () {
                Get.to(MatthewSupportsScreen());
              },
            ),
          ),
          SizedBox(width: 16.w),
          Image.asset('assets/images/shareicon.png', width: 24.w, height: 24.h),
        ],
      ),
      SizedBox(height: 32.h),
      const _CommentsCard(),
      SizedBox(height: 20.h),
    ],
  );
}

class _CommentsCard extends StatelessWidget {
  const _CommentsCard();

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(.6),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color.fromRGBO(160, 106, 249, 1)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Comments 29', style: VTPSTextStyle126004),
        SizedBox(height: 20.h),
        CommentItem(
          userAvatar: 'assets/images/user1.png',
          username: 'Clary',
          timeAgo: '3min',
          comment: 'Que descrição longa, cansei só de ler.',
          likes: '0',
        ),
        SizedBox(height: 16.h),
        CommentItem(
          userAvatar: 'assets/images/user2.png',
          username: 'Clary',
          timeAgo: '3min',
          comment: 'Não entendi esse chat não kkk',
          likes: '0',
        ),
        SizedBox(height: 16.h),
        CommentItem(
          userAvatar: 'assets/images/user3.png',
          username: 'Clary',
          timeAgo: '3min',
          comment: 'Não entendi nada, bot totalmente confuso',
          likes: '1k',
        ),
        SizedBox(height: 16.h),
        CommentItem(
          userAvatar: 'assets/images/user4.png',
          username: 'Clary',
          timeAgo: '3min',
          comment: '',
          likes: '0',
        ),
        SizedBox(height: 20.h),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(.2)),
          ),
          child: Text(
            'Comment now!',
            style: TextStyle(
              color: Colors.white.withOpacity(.6),
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    ),
  );
}
