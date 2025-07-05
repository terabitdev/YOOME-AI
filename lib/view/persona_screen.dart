import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/view/login_screnn.dart';
import 'package:get/get.dart';

class PersonaScreen extends StatelessWidget {
  const PersonaScreen({super.key});

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
                  'Create',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // AB Text Overlay
          Positioned(
            left: 20,
            bottom: 400.h,
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
                      Colors.black.withOpacity(0.6),
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
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do  ipsum dolor sit amet, adipiscing elit, psum dolor si dolor sit amet, consectetur psum dolor si elit, sed do dolor sit amet, psum dolor si adipiscing elit, sed do dolor sit amet, consectetur adipiscing .',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14.sp,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    // Small Profile Image with Dashed Border
                    Container(
                      width: 82,
                      height: 82,
                      margin: const EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFA259FF),
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                      child: DashedBorder(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/personaprofileimage.png',
                              ), // Add your small profile image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Bottom Buttons
                    Row(
                      children: [
                        // Create Button (Outlined)
                        Expanded(
                          child: Container(
                            height: 50.h,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Handle create action
                              },
                              child: Text(
                                'Create',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Use Button (Filled Purple)
                        Expanded(
                          child: Container(
                            height: 50.h,
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFA259FF), Color(0xFF7B2CBF)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => LoginScreen());
                              },
                              child: Text(
                                'Use',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
