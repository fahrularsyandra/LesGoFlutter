import 'CourseModel.dart';
import 'PaymentModel.dart';

class UserCourse {
  int? userId;
  int? companyId;
  int? courseId;
  int? paymentId;
  int? isApproved;
  int? id;
  Course? course;
  Company? company;
  Payment? payment;

  UserCourse(
      {this.userId,
      this.companyId,
      this.courseId,
      this.paymentId,
      this.isApproved,
      this.id,
      this.course,
      this.company,
      this.payment});

  UserCourse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    companyId = json['company_id'];
    courseId = json['course_id'];
    paymentId = json['payment_id'];
    isApproved = json['is_approved'];
    id = json['id'];
    course =
        json['course'] != null ? Course.fromJson(json['course']) : null;
    company =
        json['Company'] != null ? Company.fromJson(json['Company']) : null;
    payment =
        json['payment'] != null ? Payment.fromJson(json['payment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['company_id'] = companyId;
    data['course_id'] = courseId;
    data['payment_id'] = paymentId;
    data['is_approved'] = isApproved;
    data['id'] = id;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    if (company != null) {
      data['Company'] = company!.toJson();
    }
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    return data;
  }
}

class Company {
  String? name;

  Company({this.name});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
