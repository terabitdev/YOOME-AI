import 'package:get/get.dart';

class WelcomeController extends GetxController {
  // Observable variables
  var selectedGender = ''.obs;
  var selectedAge = ''.obs;

  // Gender options
  final genderOptions = [
    {'id': 'female', 'label': 'Female', 'image': 'assets/images/female.png'},
    {'id': 'male', 'label': 'Male', 'image': 'assets/images/male.png'},
    {'id': 'other', 'label': 'Other', 'image': 'assets/images/trans.png'},
  ];

  // Age options
  final ageOptions = ['12-35', '25-30', '30+'];

  // Methods
  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void selectAge(String age) {
    selectedAge.value = age;
  }
}
