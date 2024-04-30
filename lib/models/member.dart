class Member {
  late String imageAssetPath;
  late String generation;
  late String name;
  late String role;
  late String career;
  late DateTime birthday;
  late String email;
  late String address;
  late String phoneNumber;
  late List<String> hobbies;
  late List<String> skills;
  late String introduction;
  late DateTime joiningDate;
  late String executiveBoard;
  late String major;
  late String workPlace;

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