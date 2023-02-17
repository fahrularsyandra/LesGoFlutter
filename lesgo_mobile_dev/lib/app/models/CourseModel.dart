class Course {
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

  Course(
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

  Course.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? address;
  String? phone;

  Company({this.name, this.description, this.address, this.phone});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['phone'] = this.phone;
    return data;
  }
}