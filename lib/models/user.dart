class User {
  String? description;
  String? nickname;
  String? phone;
  String? firstname;
  String? lastname;
  DateTime? dob;
  String? hometown;
  Map<String, dynamic>? positionId;
  List<dynamic>? departments;
  String? job;
  String? workplace;
  String? school;
  Map<String, dynamic>? majorId;
  int? gen;
  List<String>? favourites;
  List<String>? skills;
  bool? isExcellent;
  bool? isAdmin;
  String? MSSV;
  String? id;
  String? email;
  String? avatar;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? dateJoin;
  List<dynamic>? socials;

  User({
  this.description,
  this.nickname,
  this.phone,
  this.firstname,
  this.lastname,
  this.dob,
  this.hometown,
  this.positionId,
  this.departments,
  this.job,
  this.workplace,
  this.school,
  this.majorId,
  this.gen,
  this.favourites,
  this.skills,
  this.isExcellent,
  this.isAdmin,
  this.MSSV,
  this.id,
  this.email,
  this.avatar,
  this.createdAt,
  this.updatedAt,
  this.v,
  this.dateJoin,
  this.socials
  });

  factory User.fromJson(Map<String, dynamic> item) {
    return User(
      description: item['description'],
      nickname: item['nickname'],
      phone: item['phone'],
      firstname: item['firstname'],
      lastname: item['lastname'],
      dob: item['dob'] != null ? DateTime.parse(item['dob']) : null,
      hometown: item['hometown'],
      positionId: item['positionId'],
      departments: item['departments'],
      job: item['job'],
      workplace: item['workplace'],
      school: item['school'],
      majorId: item['majorId'],
      gen: item['gen'] ?? -1,
      favourites: List<String>.from(item['favourites']),
      skills: List<String>.from(item['skills']),
      isExcellent: item['isExcellent'],
      isAdmin: item['isAdmin'],
      MSSV: item['MSSV'],
      id: item['_id'],
      email: item['email'],
      avatar: item['avatar'],
      createdAt: item['createdAt'] != null
          ? DateTime.parse(item['createdAt'])
          : null,
      updatedAt: item['updatedAt'] != null
          ? DateTime.parse(item['updatedAt'])
          : null,
      v: item['__v'],
      dateJoin: item['dateJoin'] != null
          ? DateTime.parse(item['dateJoin'])
          : null,
      socials: item['socials']
    );
  }


  String getFullname() {
    return '${this.firstname} ${this.lastname}';
  }

  @override
  String toString() {
    return 'User{description: $description, nickname: $nickname, phone: $phone, firstname: $firstname, lastname: $lastname, dateOfBirth: $dob, hometown: $hometown, positionId: $positionId, departments: $departments, job: $job, workplace: $workplace, school: $school, majorId: $majorId, dateJoin: $dateJoin, favourites: $favourites, skills: $skills, isExcellent: $isExcellent, isAdmin: $isAdmin, id: $id, email: $email, avatar: $avatar, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, socials: $socials}';
  }
}
