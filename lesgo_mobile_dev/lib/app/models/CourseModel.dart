class Course {
  int? id;
  int? courseTagId;
  String? description;
  int? quota;
  String? startDate;
  String? endDate;
  String? price;
  String? img;
  bool? isActive;
  CourseTag? courseTag;

  Course(
      {this.id,
      this.courseTagId,
      this.description,
      this.quota,
      this.startDate,
      this.endDate,
      this.price,
      this.img,
      this.isActive,
      this.courseTag});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseTagId = json['course_tag_id'];
    description = json['description'];
    quota = json['quota'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    price = json['price'];
    img = json['img'];
    isActive = json['is_active'];
    courseTag = json['course_tag'] != null
        ? new CourseTag.fromJson(json['course_tag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_tag_id'] = this.courseTagId;
    data['description'] = this.description;
    data['quota'] = this.quota;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['price'] = this.price;
    data['img'] = this.img;
    data['is_active'] = this.isActive;
    if (this.courseTag != null) {
      data['course_tag'] = this.courseTag!.toJson();
    }
    return data;
  }
}

class CourseTag {
  String? name;
  int? companyId;
  Company? company;

  CourseTag({this.name, this.companyId, this.company});

  CourseTag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    companyId = json['company_id'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['company_id'] = this.companyId;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
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