class UserProfileModel {
  final String name;
  final String email;
  final String gender;
  final String age;
  final String character;
  final String chatType;
  final List<String> personality;
  final List<String> relationship;
  final List<String> scene;

  UserProfileModel({
    required this.name,
    required this.email,
    required this.gender,
    required this.age,
    required this.character,
    required this.chatType,
    required this.personality,
    required this.relationship,
    required this.scene,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'gender': gender,
    'age': age,
    'character': character,
    'chatType': chatType,
    'personality': personality,
    'relationship': relationship,
    'scene': scene,
  };
}
