
import 'dart:convert';

AllJob allJobFromJson(String str) => AllJob.fromJson(json.decode(str));

String allJobToJson(AllJob data) => json.encode(data.toJson());

class AllJob {
  bool status;
  Message message;
  List<Datum> data;

  AllJob({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllJob.fromJson(Map<String, dynamic> json) => AllJob(
    status: json["status"],
    message: Message.fromJson(json["message"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String title;
  String employmentType;
  int workFieldId;
  String workPlace;
  CountryOfEmployment countryOfEmployment;
  String? salary;
  int salaryShow;
  int workExperience;
  String jobValidUnite;
  String summary;
  CountryOfEmployment? nationalityPrefrence;
  CountryOfEmployment? countryOfResidence;
  String? genderPerfrence;
  int requestVedio;
  String? question;
  int status;
  int businessManId;
  int? currencyId;
  int payStatus;
  int educationLevelId;
  int educationFeildId;
  int certificationId;
  dynamic fileDescription;
  dynamic countryOfGraduation;
  String createTime;
  int expireDate;
  int applicants;
  List<dynamic> invited;
  int watchesCount;
  bool isFavorite;
  bool isApplied;
  List<Watch> watches;
  EducationFeild educationLevel;
  EducationFeild educationFeild;
  Certification certification;
  EducationFeild experienceYear;
  BusinessMan businessMan;
  Currency? currency;
  List<Skill> skills;
  EducationFeild workField;

  Datum({
    required this.id,
    required this.title,
    required this.employmentType,
    required this.workFieldId,
    required this.workPlace,
    required this.countryOfEmployment,
    required this.salary,
    required this.salaryShow,
    required this.workExperience,
    required this.jobValidUnite,
    required this.summary,
    required this.nationalityPrefrence,
    required this.countryOfResidence,
    required this.genderPerfrence,
    required this.requestVedio,
    required this.question,
    required this.status,
    required this.businessManId,
    required this.currencyId,
    required this.payStatus,
    required this.educationLevelId,
    required this.educationFeildId,
    required this.certificationId,
    required this.fileDescription,
    required this.countryOfGraduation,
    required this.createTime,
    required this.expireDate,
    required this.applicants,
    required this.invited,
    required this.watchesCount,
    required this.isFavorite,
    required this.isApplied,
    required this.watches,
    required this.educationLevel,
    required this.educationFeild,
    required this.certification,
    required this.experienceYear,
    required this.businessMan,
    required this.currency,
    required this.skills,
    required this.workField,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    employmentType: json["employment_type"],
    workFieldId: json["work_field_id"],
    workPlace: json["work_place"],
    countryOfEmployment: CountryOfEmployment.fromJson(json["country_of_employment"]),
    salary: json["salary"],
    salaryShow: json["salary_show"],
    workExperience: json["work_experience"],
    jobValidUnite: json["job_valid_unite"],
    summary: json["summary"],
    nationalityPrefrence: json["nationality_prefrence"] == null ? null : CountryOfEmployment.fromJson(json["nationality_prefrence"]),
    countryOfResidence: json["country_of_residence"] == null ? null : CountryOfEmployment.fromJson(json["country_of_residence"]),
    genderPerfrence: json["gender_perfrence"],
    requestVedio: json["request_vedio"],
    question: json["question"],
    status: json["status"],
    businessManId: json["business_man_id"],
    currencyId: json["currency_id"],
    payStatus: json["pay_status"],
    educationLevelId: json["education_level_id"],
    educationFeildId: json["education_feild_id"],
    certificationId: json["certification_id"],
    fileDescription: json["file_description"],
    countryOfGraduation: json["country_of_graduation"],
    createTime: json["create_time"],
    expireDate: json["expire_date"],
    applicants: json["applicants"],
    invited: List<dynamic>.from(json["invited"].map((x) => x)),
    watchesCount: json["watches_count"],
    isFavorite: json["is_favorite"],
    isApplied: json["is_applied"],
    watches: List<Watch>.from(json["watches"].map((x) => Watch.fromJson(x))),
    educationLevel: EducationFeild.fromJson(json["education_level"]),
    educationFeild: EducationFeild.fromJson(json["education_feild"]),
    certification: Certification.fromJson(json["certification"]),
    experienceYear: EducationFeild.fromJson(json["experience_year"]),
    businessMan: BusinessMan.fromJson(json["business_man"]),
    currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
    skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
    workField: EducationFeild.fromJson(json["work_field"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "employment_type": employmentType,
    "work_field_id": workFieldId,
    "work_place": workPlace,
    "country_of_employment": countryOfEmployment.toJson(),
    "salary": salary,
    "salary_show": salaryShow,
    "work_experience": workExperience,
    "job_valid_unite": jobValidUnite,
    "summary": summary,
    "nationality_prefrence": nationalityPrefrence?.toJson(),
    "country_of_residence": countryOfResidence?.toJson(),
    "gender_perfrence": genderPerfrence,
    "request_vedio": requestVedio,
    "question": question,
    "status": status,
    "business_man_id": businessManId,
    "currency_id": currencyId,
    "pay_status": payStatus,
    "education_level_id": educationLevelId,
    "education_feild_id": educationFeildId,
    "certification_id": certificationId,
    "file_description": fileDescription,
    "country_of_graduation": countryOfGraduation,
    "create_time": createTime,
    "expire_date": expireDate,
    "applicants": applicants,
    "invited": List<dynamic>.from(invited.map((x) => x)),
    "watches_count": watchesCount,
    "is_favorite": isFavorite,
    "is_applied": isApplied,
    "watches": List<dynamic>.from(watches.map((x) => x.toJson())),
    "education_level": educationLevel.toJson(),
    "education_feild": educationFeild.toJson(),
    "certification": certification.toJson(),
    "experience_year": experienceYear.toJson(),
    "business_man": businessMan.toJson(),
    "currency": currency?.toJson(),
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "work_field": workField.toJson(),
  };
}

class BusinessMan {
  int id;
  dynamic name;
  dynamic jobTitle;
  dynamic workFieldId;
  dynamic dateOfBirth;
  dynamic gender;
  dynamic countryId;
  dynamic nationality;
  String businessName;
  int typeBusiness;
  String employeeNo;
  dynamic userName;
  String email;
  String phone;
  String introPhone;
  String telephone;
  String introTelephone;
  DateTime emailVerifiedAt;
  int roleId;
  DateTime createdAt;
  DateTime updatedAt;
  int activeStatus;
  dynamic verifyCode;
  int completeStatus;
  String website;
  int contactPrivacy;
  String bio;
  int isFromSocialite;
  int activeSocialite;
  dynamic fcmToken;
  dynamic stripeId;
  dynamic pmType;
  dynamic pmLastFour;
  dynamic trialEndsAt;
  dynamic businessEntity;
  dynamic incorporationYear;
  dynamic registrationCertificate;
  dynamic instagram;
  dynamic media;
  String imageUrl;
  String coverUrl;
  dynamic cvFileUrl;
  String experienceYears;
  int numberExperienceYears;
  dynamic nameWithCertifications;
  int isComplete;

  BusinessMan({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.workFieldId,
    required this.dateOfBirth,
    required this.gender,
    required this.countryId,
    required this.nationality,
    required this.businessName,
    required this.typeBusiness,
    required this.employeeNo,
    required this.userName,
    required this.email,
    required this.phone,
    required this.introPhone,
    required this.telephone,
    required this.introTelephone,
    required this.emailVerifiedAt,
    required this.roleId,
    required this.createdAt,
    required this.updatedAt,
    required this.activeStatus,
    required this.verifyCode,
    required this.completeStatus,
    required this.website,
    required this.contactPrivacy,
    required this.bio,
    required this.isFromSocialite,
    required this.activeSocialite,
    required this.fcmToken,
    required this.stripeId,
    required this.pmType,
    required this.pmLastFour,
    required this.trialEndsAt,
    required this.businessEntity,
    required this.incorporationYear,
    required this.registrationCertificate,
    required this.instagram,
    required this.media,
    required this.imageUrl,
    required this.coverUrl,
    required this.cvFileUrl,
    required this.experienceYears,
    required this.numberExperienceYears,
    required this.nameWithCertifications,
    required this.isComplete,
  });

  factory BusinessMan.fromJson(Map<String, dynamic> json) => BusinessMan(
    id: json["id"],
    name: json["name"],
    jobTitle: json["job_title"],
    workFieldId: json["work_field_id"],
    dateOfBirth: json["date_of_birth"],
    gender: json["gender"],
    countryId: json["country_id"],
    nationality: json["nationality"],
    businessName: json["business_name"],
    typeBusiness: json["type_business"],
    employeeNo: json["employee_no"],
    userName: json["user_name"],
    email: json["email"],
    phone: json["phone"],
    introPhone: json["intro_phone"],
    telephone: json["telephone"],
    introTelephone: json["intro_telephone"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    roleId: json["role_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    activeStatus: json["active_status"],
    verifyCode: json["verify_code"],
    completeStatus: json["complete_status"],
    website: json["website"],
    contactPrivacy: json["contact_privacy"],
    bio: json["bio"],
    isFromSocialite: json["is_from_socialite"],
    activeSocialite: json["active_socialite"],
    fcmToken: json["fcm_token"],
    stripeId: json["stripe_id"],
    pmType: json["pm_type"],
    pmLastFour: json["pm_last_four"],
    trialEndsAt: json["trial_ends_at"],
    businessEntity: json["business_entity"],
    incorporationYear: json["incorporation_year"],
    registrationCertificate: json["registration_certificate"],
    instagram: json["instagram"],
    media: json["media"],
    imageUrl: json["image_url"],
    coverUrl: json["cover_url"],
    cvFileUrl: json["cv_file_url"],
    experienceYears: json["experience_years"],
    numberExperienceYears: json["number_experience_years"],
    nameWithCertifications: json["name_with_certifications"],
    isComplete: json["is_complete"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "job_title": jobTitle,
    "work_field_id": workFieldId,
    "date_of_birth": dateOfBirth,
    "gender": gender,
    "country_id": countryId,
    "nationality": nationality,
    "business_name": businessName,
    "type_business": typeBusiness,
    "employee_no": employeeNo,
    "user_name": userName,
    "email": email,
    "phone": phone,
    "intro_phone": introPhone,
    "telephone": telephone,
    "intro_telephone": introTelephone,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "role_id": roleId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "active_status": activeStatus,
    "verify_code": verifyCode,
    "complete_status": completeStatus,
    "website": website,
    "contact_privacy": contactPrivacy,
    "bio": bio,
    "is_from_socialite": isFromSocialite,
    "active_socialite": activeSocialite,
    "fcm_token": fcmToken,
    "stripe_id": stripeId,
    "pm_type": pmType,
    "pm_last_four": pmLastFour,
    "trial_ends_at": trialEndsAt,
    "business_entity": businessEntity,
    "incorporation_year": incorporationYear,
    "registration_certificate": registrationCertificate,
    "instagram": instagram,
    "media": media,
    "image_url": imageUrl,
    "cover_url": coverUrl,
    "cv_file_url": cvFileUrl,
    "experience_years": experienceYears,
    "number_experience_years": numberExperienceYears,
    "name_with_certifications": nameWithCertifications,
    "is_complete": isComplete,
  };
}

class Certification {
  int id;
  String abbreviation;
  String name;

  Certification({
    required this.id,
    required this.abbreviation,
    required this.name,
  });

  factory Certification.fromJson(Map<String, dynamic> json) => Certification(
    id: json["id"],
    abbreviation: json["abbreviation"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "abbreviation": abbreviation,
    "name": name,
  };
}

class CountryOfEmployment {
  int id;
  String code;
  String prefixNumber;
  String countryImage;
  String name;

  CountryOfEmployment({
    required this.id,
    required this.code,
    required this.prefixNumber,
    required this.countryImage,
    required this.name,
  });

  factory CountryOfEmployment.fromJson(Map<String, dynamic> json) => CountryOfEmployment(
    id: json["id"],
    code: json["code"],
    prefixNumber: json["prefix_number"],
    countryImage: json["country_image"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "prefix_number": prefixNumber,
    "country_image": countryImage,
    "name": name,
  };
}

class Currency {
  int id;
  String name;
  String shape;

  Currency({
    required this.id,
    required this.name,
    required this.shape,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json["id"],
    name: json["name"],
    shape: json["shape"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "shape": shape,
  };
}

class EducationFeild {
  int id;
  Name name;

  EducationFeild({
    required this.id,
    required this.name,
  });

  factory EducationFeild.fromJson(Map<String, dynamic> json) => EducationFeild(
    id: json["id"],
    name: nameValues.map[json["name"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
  };
}

enum Name {
  MASTER,
  TECH,
  TEST,
  TEST1,
  THE_200300_DAYS
}

final nameValues = EnumValues({
  "master": Name.MASTER,
  "tech": Name.TECH,
  "test": Name.TEST,
  "test1": Name.TEST1,
  "200-300 days": Name.THE_200300_DAYS
});

class Skill {
  int id;
  Name name;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  Skill({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    id: json["id"],
    name: nameValues.map[json["name"]]!,
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  int jobId;
  int skillId;

  Pivot({
    required this.jobId,
    required this.skillId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    jobId: json["job_id"],
    skillId: json["skill_id"],
  );

  Map<String, dynamic> toJson() => {
    "job_id": jobId,
    "skill_id": skillId,
  };
}

class Watch {
  int id;
  dynamic deviceId;
  int jobId;
  DateTime createdAt;
  DateTime updatedAt;

  Watch({
    required this.id,
    required this.deviceId,
    required this.jobId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Watch.fromJson(Map<String, dynamic> json) => Watch(
    id: json["id"],
    deviceId: json["device_id"],
    jobId: json["job_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "device_id": deviceId,
    "job_id": jobId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Message {
  String message;

  Message({
    required this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
