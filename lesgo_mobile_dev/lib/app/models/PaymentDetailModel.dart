import 'CourseModel.dart';
import 'PaymentModel.dart';

class PaymentDetail {
  int? userId;
  int? companyId;
  int? courseId;
  int? paymentId;
  int? isApproved;
  int? id;
  Company? company;
  Course? course;
  Payment? payment;

  PaymentDetail(
      {this.userId,
      this.companyId,
      this.courseId,
      this.paymentId,
      this.isApproved,
      this.id,
      this.company,
      this.course,
      this.payment});

  PaymentDetail.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    companyId = json['company_id'];
    courseId = json['course_id'];
    paymentId = json['payment_id'];
    isApproved = json['is_approved'];
    id = json['id'];
    company =
        json['Company'] != null ? new Company.fromJson(json['Company']) : null;
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
    payment =
        json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    data['course_id'] = this.courseId;
    data['payment_id'] = this.paymentId;
    data['is_approved'] = this.isApproved;
    data['id'] = this.id;
    if (this.company != null) {
      data['Company'] = this.company!.toJson();
    }
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

