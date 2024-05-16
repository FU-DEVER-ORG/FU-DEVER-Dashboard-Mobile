class Member {
  late String? description;
  late String? nickname;
  late String? phone;
  late String? firstname;
  late String? lastname;
  late DateTime? dateOfBirth;
  late String? hometown;
  late Map<String, dynamic>? positionId; // This is an object in the provided data
  late Map<String, dynamic>? departmentId; // This is an object in the provided data
  late String? job;
  late String? workplace;
  late String? school;
  late Map<String, dynamic>? majorId; // This is an object in the provided data
  late DateTime? dateJoin; // Join date is typically a DateTime
  late List<String>? favourites; // These are lists of strings in the provided data
  late List<String>? skills; // These are lists of strings in the provided data
  late bool? isExcellent;
  late bool? isAdmin;
  late String? id;
  late String? email;
  late String? avatar;
  late DateTime? createdAt; // Created at is typically a DateTime
  late DateTime? updatedAt; // Updated at is typically a DateTime
  late int? v; // "__v" is typically an integer


  String getGen(){
    if (dateJoin == null) {
      return 'noGen';
    }

    int startYear = 2017;
    int gen = 1;

    while (DateTime(startYear + gen, 9).isBefore(dateJoin!)) {
      gen++;
    }

    return 'Gen $gen';
  }
  String getFullname(){
    return '${this.firstname} ${this.lastname}';
  }
  Member(
      {required this.description,
      required this.nickname,
      required this.phone,
      required this.firstname,
      required this.lastname,
      required this.dateOfBirth,
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
      dateOfBirth: item['dateOfBirth'] != null ? DateTime.parse(item['dateOfBirth']) : null,
      hometown: item['hometown'],
      positionId: item['positionId'],
      departmentId: item['departmentId'],
      job: item['job'],
      workplace: item['workplace'],
      school: item['school'],
      majorId: item['majorId'],
      dateJoin: item['dateJoin'] != null ? DateTime.parse(item['dateJoin']) : null,
      favourites: List<String>.from(item['favourites']),
      skills: List<String>.from(item['skills']),
      isExcellent: item['isExcellent'],
      isAdmin: item['isAdmin'],
      id: item['_id'],
      email: item['email'],
      avatar: item['avatar'],
      createdAt: item['createdAt'] != null ? DateTime.parse(item['createdAt']) : null,
      updatedAt: item['updatedAt'] != null ? DateTime.parse(item['updatedAt']) : null,
      v: item['__v'],
    );
  }
}