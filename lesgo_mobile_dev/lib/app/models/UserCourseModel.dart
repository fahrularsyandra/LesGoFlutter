class UserCourse {
  int? id;
  int? userId;
  int? companyId;
  int? courseId;
  int? paymentId;
  bool? isApproved;
  User? user;

  UserCourse(
      {this.id,
      this.userId,
      this.companyId,
      this.courseId,
      this.paymentId,
      this.isApproved,
      this.user});

  UserCourse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    companyId = json['company_id'];
    courseId = json['course_id'];
    paymentId = json['payment_id'];
    isApproved = json['is_approved'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['company_id'] = companyId;
    data['course_id'] = courseId;
    data['payment_id'] = paymentId;
    data['is_approved'] = isApproved;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;

  User({this.id, this.username, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}