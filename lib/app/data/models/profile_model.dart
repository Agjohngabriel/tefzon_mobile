import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.data,
  });

  Data data;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.avatar,
    this.email,
    this.referralLink,
    this.phone,
    this.gender,
    this.dob,
    this.country,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? username;
  dynamic avatar;
  String? email;
  String? referralLink;
  dynamic phone;
  String? gender;
  String? dob;
  String? country;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
    avatar: json["avatar"],
    email: json["email"],
    referralLink: json["referral_link"],
    phone: json["phone"],
    gender: json["gender"],
    dob: json["dob"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "avatar": avatar,
    "email": email,
    "referral_link": referralLink,
    "phone": phone,
    "gender": gender,
    "dob": dob,
    "country": country,
  };
}
