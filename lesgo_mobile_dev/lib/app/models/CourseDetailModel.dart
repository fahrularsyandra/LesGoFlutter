class CourseDetail {
  int? id;
  int? courseTagId;
  String? description;
  int? quota;
  String? startDate;
  String? endDate;
  String? price;
  String? img;
  bool? isActive;

  CourseDetail(
      {this.id,
      this.courseTagId,
      this.description,
      this.quota,
      this.startDate,
      this.endDate,
      this.price,
      this.img,
      this.isActive});

  CourseDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseTagId = json['course_tag_id'];
    description = json['description'];
    quota = json['quota'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    price = json['price'];
    img = json['img'];
    isActive = json['is_active'];
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
    return data;
  }
}
