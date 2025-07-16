import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/resources/components/reuseable_textfield.dart';
import 'package:yoome_ai/resources/components/toggle_button.dart';
import 'package:yoome_ai/resources/constants/app_style.dart';
import 'package:yoome_ai/view/character_setting_screen.dart';
import 'package:yoome_ai/view/enhanced_memory_screen.dart';
import 'package:yoome_ai/view/persona_screen.dart';
import 'package:yoome_ai/view/report_screen.dart';
import 'package:yoome_ai/view/share_screen.dart';

class MatthewSupportsScreen extends StatefulWidget {
  @override
  _MatthewSupportsScreenState createState() => _MatthewSupportsScreenState();
}

class _MatthewSupportsScreenState extends State<MatthewSupportsScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool _showActionButtons = false;

  static List<Map<String, dynamic>> _imageData = [
    {
      'imageUrl': 'assets/images/enhanced.png',
      'label': 'Enhanced\nmemory',
      'screen': EnhancedMemoryScreen(),
    },
    {
      'imageUrl': 'assets/images/persona.png',
      'label': 'Persona',
      'screen': const PersonaScreen(),
    },
    {
      'imageUrl': 'assets/images/reset.png',
      'label': 'Reset',
      'screen': MatthewSupportsScreen(),
    },
    {
      'imageUrl': 'assets/images/share.png',
      'label': 'Share',
      'screen': const ShareScreen(),
    },
    {
      'imageUrl': 'assets/images/report.png',
      'label': 'Report',
      'screen': const ReportScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool? isToggled = false;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Color(0xFF5E3F93), Colors.black],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ─────── Static AppBar ───────
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        'assets/images/arrow_back.png',
                        width: 23,
                        height: 23,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(const CharacterSettingScreen()),
                      child: Image.asset(
                        'assets/images/menu.png',
                        width: 23,
                        height: 23,
                      ),
                    ),
                  ],
                ),
              ),

              // ─────── Scrollable Chat Section ───────
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Chat Bubble
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildMessageText(),
                            SizedBox(height: 15),
                            _buildMessageText(),
                            SizedBox(height: 15),
                            _buildMessageText(),
                            SizedBox(height: 15),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet.',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 14,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // No Audio
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        width: 70.w,
                        height: 30.h,
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF090017).withOpacity(0.3),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          'No Audio',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [_buildMessageText()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ─────── Static Bottom Section ───────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Media Controls
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildMediaControlButton(
                                'assets/images/refresh.png',
                              ),
                              const SizedBox(width: 6),
                              _buildMediaControlButton(
                                'assets/images/pause.png',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 23),

                    // Character Info and Toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ayato Hiroshi | Cold Prince',
                              style: MSTextStyle13500,
                            ),
                            Text(
                              '@Elara',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/rightarrow.png',
                              width: 17,
                              height: 17,
                            ),
                            SizedBox(width: 37),
                            Image.asset(
                              'assets/images/shareicon.png',
                              width: 27,
                              height: 27,
                            ),
                            SizedBox(width: 15),
                            StatefulBuilder(
                              builder: (context, setStateSwitch) {
                                return CustomToggleSwitch(
                                  value: isToggled ?? true,
                                  onChanged: (value) {
                                    setStateSwitch(() {
                                      isToggled = value;
                                    });
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Text Field
                    ReusableTextField(
                      hint: 'Message Ayato Hiroshi | Cold Prince',
                      suffixWidgets: [
                        Image.asset(
                          'assets/images/textfieldimage.png',
                          width: 24,
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _showActionButtons = !_showActionButtons;
                            });
                          },
                          child: Image.asset(
                            'assets/images/text.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    // Action Buttons
                    if (_showActionButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(5, (index) {
                          return _actionButton(
                            imageUrl: _imageData[index]['imageUrl']!,
                            label: _imageData[index]['label']!,
                            onTap: () {
                              Get.to(_imageData[index]['screen']);
                            },
                          );
                        }),
                      ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 14,
          height: 1.4,
        ),
        children: [
          TextSpan(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, ',
          ),
          TextSpan(
            text: 'consectetur adipiscing elit',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                ', sed do dolor sit amet, consectetur adipiscing elit, sed do dolor sit amet, consectetur adipiscing.',
          ),
        ],
      ),
    );
  }

  // Helper to create the circular action button with image and label
  Widget _actionButton({
    required String imageUrl,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFF25104A),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/nocharacter.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.white70,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMediaControlButton(String imagePath) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Image.asset(imagePath, width: 19, height: 19),
  );
}
