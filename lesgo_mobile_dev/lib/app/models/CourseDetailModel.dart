class CourseDetail {
  int? id;
  int? companyId;
  String? name;
  String? description;
  int? quota;
  int? participant;
  String? startDate;
  String? endDate;
  String? price;
  String? img;
  bool? isActive;
  Company? company;

  CourseDetail(
      {this.id,
      this.companyId,
      this.name,
      this.description,
      this.quota,
      this.participant,
      this.startDate,
      this.endDate,
      this.price,
      this.img,
      this.isActive,
      this.company});

  CourseDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    description = json['description'];
    quota = json['quota'];
    participant = json['participant'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    price = json['price'];
    img = json['img'];
    isActive = json['is_active'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['quota'] = this.quota;
    data['participant'] = this.participant;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['price'] = this.price;
    data['img'] = this.img;
    data['is_active'] = this.isActive;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}

class Company {
  String? name;
  String? address;

  Company({this.name, this.address});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }
}