class Member {
  late String? description;
  late String? nickname;
  late String? phone;
  late String? firstname;
  late String? lastname;
  late String? dob;
  late String? hometown;
  late String? positionId;
  late String? departmentId;
  late String? job;
  late String? workplace;
  late String? school;
  late String? majorId;
  late String? dateJoin;
  late List<String?> favourites;
  late List<String?> skills;
  late bool? isExcellent;
  late bool? isAdmin;
  late String? id;
  late String? email;
  late String? avatar;
  late DateTime? createdAt;
  late DateTime? updatedAt;
  late String? v;

  Member(
      {required this.description,
      required this.nickname,
      required this.phone,
      required this.firstname,
      required this.lastname,
      required this.dob,
      required this.hometown,
      required this.positionId,
      required this.departmentId,
      required this.job,
      required this.workplace,
      required this.school,
      required this.majorId,
      required this.dateJoin,
      required this.favourites,
      required this.skills,
      required this.isExcellent,
      required this.isAdmin,
      required this.id,
      required this.email,
      required this.avatar,
      required this.createdAt,
      required this.updatedAt,
      required this.v});

  factory Member.fromJson(Map<String?, dynamic> item) {
    return Member(
      description: item['description'],
      nickname: item['nickname'],
      phone: item['phone'],
      firstname: item['firstname'],
      lastname: item['lastname'],
      dob: item['dob'],
      hometown: item['hometown'],
      positionId: item['positionId'],
      departmentId: item['departmentId'],
      job: item['job'],
      workplace: item['workplace'],
      school: item['school'],
      majorId: item['majorId'],
      dateJoin: item['dateJoin'],
      favourites: item['favourites'],
      skills: item['skills'],
      isExcellent: item['isExcellent'],
      isAdmin: item['isAdmin'],
      id: item['_id'],
      email: item['email'],
      avatar: item['avatar'],
      createdAt: item['createdAt'],
      updatedAt: item['updatedAt'],
      v: item['__v'],
    );
  }
}