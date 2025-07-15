import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoome_ai/Controllers/edit_screen_controller.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/bio_textfield_widget.dart';
import 'package:yoome_ai/resources/components/gender_option_widget.dart';
import 'package:yoome_ai/resources/components/round_button.dart';

class EditScreen extends StatelessWidget {
  final controller = Get.put(EditProfileController());

  EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        return Stack(
          children: [
            // ✅ Profile image background
            // ✅ Background image (fixed height)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 400.h,
              child: GetBuilder<EditProfileController>(
                builder: (controller) {
                  if (controller.pickedImageFile != null) {
                    return Image.file(
                      controller.pickedImageFile!,
                      fit: BoxFit.cover,
                    );
                  } else if (controller.avatarUrl.value.startsWith('http')) {
                    return Image.network(
                      controller.avatarUrl.value,
                      fit: BoxFit.cover,
                    );
                  } else {
                    return Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    );
                  }
                },
              ),
            ),

            // ✅ Gradient overlay for readability
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 280.h,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  ),
                ),
              ),
            ),

            // ✅ Dark overlay for readability
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.6)),
            ),

            // ✅ App bar back button
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              left: 20,
              child: Container(
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
            ),

            // ✅ Camera icon placeholder (optional action)
            Positioned(
              top: 220.h,
              left: 24.w,
              child: GestureDetector(
                onTap: () {
                  controller.pickImageFromGallery();
                },
                child: Image.asset(
                  'assets/images/camear1.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ),

            // ✅ Form card
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Name Label
                      Text(
                        'Name*',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),

                      /// Name Input
                      TextField(
                        controller: controller.nameController,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConstants.buttonColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// Gender Label
                      Text(
                        'Gender*',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),

                      /// Gender Options
                      Row(
                        children: [
                          GenderOptionWidget(
                            gender: 'Female',
                            selectedGender: controller.gender.value,
                            onTap: controller.updateGender,
                          ),
                          const SizedBox(width: 12),
                          GenderOptionWidget(
                            gender: 'Male',
                            selectedGender: controller.gender.value,
                            onTap: controller.updateGender,
                          ),
                          const SizedBox(width: 12),
                          GenderOptionWidget(
                            gender: 'Other',
                            selectedGender: controller.gender.value,
                            onTap: controller.updateGender,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      /// Bio Label
                      Text(
                        'Bio',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),

                      /// Bio Input
                      BorderedMultilineInput(
                        controller: controller.bioController,
                        hint: 'Add your bio',
                      ),
                      const SizedBox(height: 30),

                      /// Save Button
                      Obx(() {
                        return controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : RoundButton(
                                title: 'Save',
                                color: ColorConstants.buttonColor,
                                onTap: controller.saveChanges,
                              );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
