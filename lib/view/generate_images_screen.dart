import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoome_ai/resources/components/custom_appheader.dart';
import 'package:yoome_ai/resources/constants/app_images.dart';

class GenerateImagesScreen extends StatefulWidget {
  const GenerateImagesScreen({Key? key}) : super(key: key);

  @override
  State<GenerateImagesScreen> createState() => _GenerateImagesScreenState();
}

class _GenerateImagesScreenState extends State<GenerateImagesScreen> {
  final TextEditingController _promptController = TextEditingController();

  final List<String> suggestions = [
    "Dark warrior mode",
    "Samurai night sky",
    "Magical school uniform",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          CustomAppHeader(
            title: "Generate Images",
            onBackPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(height: 15.h),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: TextField(
                        controller: _promptController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Write Prompt...",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.r,
                            vertical: 16.r,
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3A3A3A),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Image.asset(
                              'assets/images/prompt.png',
                              width: 18.r,
                              height: 18.r,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 22.h),
                    Wrap(
                      spacing: 12.r,
                      runSpacing: 8.r,
                      children: suggestions.map((suggestion) {
                        return GestureDetector(
                          onTap: () {
                            _promptController.text = suggestion;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.r,
                              vertical: 10.r,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Text(
                              suggestion,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      height: 415,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: const DecorationImage(
                          image: AssetImage(AppImages.generateimage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white30,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Handle re-generate action
                                print("Re-Generate pressed");
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text(
                                "Re-Generate",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Select Button (Filled)
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
                              ),
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Handle select action
                                print("Select pressed");
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                              ),
                              child: const Text(
                                "Select",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }
}
