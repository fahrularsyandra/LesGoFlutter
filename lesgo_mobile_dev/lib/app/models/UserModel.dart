class User {
  int? id;
  String? username;
  String? email;
  int? roleId;
  Profile? profile;

  User({this.id, this.username, this.email, this.roleId, this.profile});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    roleId = json['role_id'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['role_id'] = roleId;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  int? age;
  String? address;
  String? gender;
  String? img;
  int? userId;

  Profile(
      {this.id, this.age, this.address, this.gender, this.img, this.userId});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    age = json['age'];
    address = json['address'];
    gender = json['gender'];
    img = json['img'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['age'] = age;
    data['address'] = address;
    data['gender'] = gender;
    data['img'] = img;
    data['user_id'] = userId;
    return data;
  }
}
