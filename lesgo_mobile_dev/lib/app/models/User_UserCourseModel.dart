class UserCourse {
  int? userId;
  int? companyId;
  int? courseId;
  int? paymentId;
  bool? isApproved;
  int? id;
  Course? course;
  CourseTag? company;

  UserCourse(
      {this.userId,
      this.companyId,
      this.courseId,
      this.paymentId,
      this.isApproved,
      this.id,
      this.course,
      this.company});

  UserCourse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    companyId = json['company_id'];
    courseId = json['course_id'];
    paymentId = json['payment_id'];
    isApproved = json['is_approved'];
    id = json['id'];
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
    company = json['Company'] != null
        ? new CourseTag.fromJson(json['Company'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    data['course_id'] = this.courseId;
    data['payment_id'] = this.paymentId;
    data['is_approved'] = this.isApproved;
    data['id'] = this.id;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    if (this.company != null) {
      data['Company'] = this.company!.toJson();
    }
    return data;
  }
}

class Course {
  String? startDate;
  String? endDate;
  CourseTag? courseTag;

  Course({this.startDate, this.endDate, this.courseTag});

  Course.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
    courseTag = json['course_tag'] != null
        ? new CourseTag.fromJson(json['course_tag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    if (this.courseTag != null) {
      data['course_tag'] = this.courseTag!.toJson();
    }
    return data;
  }
}

class CourseTag {
  String? name;

  CourseTag({this.name});

  CourseTag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}