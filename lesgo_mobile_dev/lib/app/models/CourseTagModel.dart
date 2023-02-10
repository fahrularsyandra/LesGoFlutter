class CourseTag {
  int? id;
  String? name;
  int? duration;
  int? companyId;
  Company? company;

  CourseTag({this.id, this.name, this.duration, this.companyId, this.company});

  CourseTag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    companyId = json['company_id'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['company_id'] = this.companyId;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}

class Company {
  int? id;
  String? name;
  String? description;
  String? address;
  String? phone;
  String? img;
  int? userId;
  bool? isApproved;

  Company(
      {this.id,
      this.name,
      this.description,
      this.address,
      this.phone,
      this.img,
      this.userId,
      this.isApproved});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    phone = json['phone'];
    img = json['img'];
    userId = json['user_id'];
    isApproved = json['is_approved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['img'] = this.img;
    data['user_id'] = this.userId;
    data['is_approved'] = this.isApproved;
    return data;
  }
}