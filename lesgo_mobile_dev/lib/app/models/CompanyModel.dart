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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['address'] = address;
    data['phone'] = phone;
    data['img'] = img;
    data['user_id'] = userId;
    data['is_approved'] = isApproved;
    return data;
  }
}