import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yoome_ai/resources/colors/app_colors.dart';
import 'package:yoome_ai/resources/components/bio_textfield_widget.dart';
import 'package:yoome_ai/resources/components/round_button.dart';
import 'package:yoome_ai/resources/components/tab_button_widget.dart';
import 'package:yoome_ai/resources/components/upload_section_widget.dart';
import 'package:yoome_ai/view/create_avatar_screen2.dart';

class CreateCharacterScreen2 extends StatefulWidget {
  const CreateCharacterScreen2({super.key});

  @override
  State<CreateCharacterScreen2> createState() => _CreateCharacterScreen2State();
}

class _CreateCharacterScreen2State extends State<CreateCharacterScreen2> {
  final TextEditingController _characterController = TextEditingController();
  String selectedImageStyle = 'Tinder Style';
  int selectedTab = 0; // 0 = Reference Images, 1 = Upload
  File? selectedImage;

  final List<Map<String, String>> imageStyles = [
    {'image': 'assets/images/imagestyle1.png', 'name': 'Tinder Style'},
    {'image': 'assets/images/imagestyle2.png', 'name': 'Anime Style'},
    {'image': 'assets/images/imagestyle3.png', 'name': 'Cartoon Style'},
  ];

  Future<void> requestStoragePermission() async {
    if (await Permission.storage.request().isGranted ||
        await Permission.photos.request().isGranted) {
      print("Permission granted");
    } else {
      print("Permission denied");
    }
  }

  Future<void> _pickImage() async {
    await requestStoragePermission();

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
      print('Selected image path: ${image.path}');
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 52.h, 24.w, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'Create Character',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Character definition',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    BorderedMultilineInput(
                      controller: _characterController,
                      hint: 'Describe a Character you wish to create',
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        SegmentedTabButton(
                          title: 'Reference Images',
                          isSelected: selectedTab == 0,
                          onTap: () => setState(() => selectedTab = 0),
                          isMiddle: false,
                        ),
                        SegmentedTabButton(
                          title: 'Upload',
                          isSelected: selectedTab == 1,
                          onTap: () => setState(() => selectedTab = 1),
                          isMiddle: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: _pickImage,
                      child: UploadSection(selectedImage: selectedImage),
                    ),
                    SizedBox(height: 24.h),
                    if (selectedTab == 0) ...[
                      Text(
                        'Image Style',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 160.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageStyles.length,
                          itemBuilder: (context, index) {
                            return _buildImageStyleCard(index);
                          },
                        ),
                      ),
                      SizedBox(height: 24.h),
                    ],
                    RoundButton(
                      title: 'Continue',
                      color: ColorConstants.buttonColor,
                      onTap: () {
                        print('Character: ${_characterController.text}');
                        print('Selected Style: $selectedImageStyle');
                        // Get.to(CreateAvatarScreen2());
                      },
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageStyleCard(int index) {
    final style = imageStyles[index];
    final isSelected = selectedImageStyle == style['name'];

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImageStyle = style['name']!;
        });
      },
      child: Container(
        width: 140.w,
        margin: EdgeInsets.only(
          right: index == imageStyles.length - 1 ? 0 : 16.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFA259FF)
                : Colors.white.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(style['image']!, fit: BoxFit.cover),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _characterController.dispose();
    super.dispose();
  }
}
