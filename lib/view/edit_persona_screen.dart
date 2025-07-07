import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/components/dual_action_button_widget.dart';
import 'package:yoome_ai/view/login_screnn.dart';
import 'package:get/get.dart';

class EditPersonaScreen extends StatelessWidget {
  const EditPersonaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image - Full Screen
          SizedBox.expand(
            child: Image.asset(
              'assets/images/backimage.png', // Use your anime character image
              fit: BoxFit.cover,
            ),
          ),

          // Top App Bar
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Edit Persona',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // AB Text Overlay
          Positioned(
            left: 20,
            bottom: 350.h,
            child: Text(
              'AB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Content with Minimal Gradient
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.3, 0.5, 0.7, 0.85, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Lorem Ipsum Text Container
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xFFA259FF), width: 1),
                      ),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ipsum dolor sit amet, adipiscing elit, psum .',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14.sp,
                          height: 1.4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    // Three Profile Images Row with Dashed Borders
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // First Image
                        _buildProfileImage(
                          'assets/images/personaprofileimage.png',
                          isSelected: true,
                        ),
                        const SizedBox(width: 12),

                        // Second Image
                        _buildProfileImage(
                          'assets/images/personaimage.png', // Add your second image
                          isSelected: false,
                        ),
                        const SizedBox(width: 12),

                        // Add New Image Container
                        _buildAddImageContainer(),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Bottom Buttons using DualActionButtons
                    DualActionButtons(
                      leftLabel: 'Edit',
                      rightLabel: 'Confirm',
                      leftIsPrimary: false,
                      onLeftTap: () {
                        // Handle edit action
                        print('Edit tapped');
                      },
                      onRightTap: () {
                        // Handle confirm action
                        print('Confirm tapped');
                        Get.to(() => LoginScreen());
                      },
                    ),

                    SizedBox(height: MediaQuery.of(context).padding.bottom),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage(String imagePath, {required bool isSelected}) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: DashedBorder(
        color: isSelected
            ? const Color(0xFFA259FF)
            : Colors.white.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddImageContainer() {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
      ),
      child: DashedBorder(
        color: Colors.white.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple.withOpacity(0.3),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}

// Custom Dashed Border Widget
class DashedBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashSpace;

  const DashedBorder({
    Key? key,
    required this.child,
    this.color = const Color(0xFFA259FF),
    this.strokeWidth = 2.0,
    this.dashLength = 5.0,
    this.dashSpace = 3.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        color: color,
        strokeWidth: strokeWidth,
        dashLength: dashLength,
        dashSpace: dashSpace,
      ),
      child: child,
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashSpace;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(10),
        ),
      );

    final dashPath = Path();
    for (final metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final nextDistance = distance + dashLength;
        if (nextDistance > metric.length) {
          dashPath.addPath(
            metric.extractPath(distance, metric.length),
            Offset.zero,
          );
          break;
        }
        dashPath.addPath(
          metric.extractPath(distance, nextDistance),
          Offset.zero,
        );
        distance = nextDistance + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
