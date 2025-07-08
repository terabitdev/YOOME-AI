import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/resources/components/reuseable_textfield.dart';
import 'package:yoome_ai/view/enhanced_memory_screen.dart';
import 'package:yoome_ai/view/persona_screen.dart';
import 'package:yoome_ai/view/report_screen.dart';
import 'package:yoome_ai/view/reset_screen.dart';
import 'package:yoome_ai/view/share_screen.dart';

class MatthewSupportsScreen extends StatefulWidget {
  @override
  _MatthewSupportsScreenState createState() => _MatthewSupportsScreenState();
}

class _MatthewSupportsScreenState extends State<MatthewSupportsScreen> {
  final TextEditingController _messageController = TextEditingController();

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
      'screen': const ResetScreen(),
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2D1B69), Color(0xFF1A0E3D)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // 🔧 Fixed AppBar (not scrollable)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/arrow_back.png',
                      width: 23,
                      height: 23,
                    ),
                    Image.asset(
                      'assets/images/menu.png',
                      width: 23,
                      height: 23,
                    ),
                  ],
                ),
              ),

              // 🔧 Scrollable area starts here
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ), // 🔧 Unified padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Chat Bubble
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(bottom: 20),
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
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'No Audio',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 12,
                            ),
                          ),
                        ),

                        // Media Controls
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                  _buildMediaControlButton(Icons.refresh),
                                  const SizedBox(width: 6),
                                  _buildMediaControlButton(Icons.play_arrow),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Character Info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ayato Hiroshi | Cold Prince',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                                  'assets/images/shareicon.png',
                                  width: 27,
                                  height: 27,
                                ),
                                SizedBox(width: 15),
                                StatefulBuilder(
                                  builder: (context, setStateSwitch) {
                                    return Switch(
                                      value: isToggled!,
                                      onChanged: (value) {
                                        setState(() {
                                          isToggled = value;
                                        });
                                        setStateSwitch(() {});
                                      },
                                      activeColor: Colors.purple,
                                      activeTrackColor: Colors.purple,
                                      inactiveThumbColor: Colors.purple,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        // Reusable Text Field
                        ReusableTextField(
                          hint: 'Message Ayato Hiroshi | Cold Prince',
                          suffixWidgets: [
                            Image.asset(
                              'assets/images/textfieldimage.png',
                              width: 24,
                              height: 24,
                            ),
                            Image.asset(
                              'assets/images/text.png',
                              width: 24,
                              height: 24,
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),

                        // Action Buttons
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
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
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
              shape: BoxShape.circle,
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

Widget _buildMediaControlButton(IconData icon) {
  return Container(
    width: 34,
    height: 34,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      shape: BoxShape.circle,
    ),
    child: Icon(icon, size: 20, color: Colors.white),
  );
}
