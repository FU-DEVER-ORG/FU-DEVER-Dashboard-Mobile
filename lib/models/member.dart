class Member {
  final String imageAssetPath;
  final String generation;
  final String name;
  final String role;
  final String career;
  final DateTime birthday;
  final String email;
  final String address;
  final String phoneNumber;
  final List<String> hobbies;
  final List<String> skills;
  final String introduction;
  final DateTime joiningDate;
  final String executiveBoard;
  final String major;
  final String workPlace;

  Member({
    required this.imageAssetPath,
    required this.generation,
    required this.name,
    required this.role,
    required this.career,
    required this.birthday,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.hobbies,
    required this.skills,
    required this.introduction,
    required this.joiningDate,
    required this.executiveBoard,
    required this.major,
    required this.workPlace,
  });
}