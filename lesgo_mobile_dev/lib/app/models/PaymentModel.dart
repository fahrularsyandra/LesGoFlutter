class Payment {
  int? id;
  String? providerService;
  String? accountNumber;
  String? name;
  int? companyId;

  Payment(
      {this.id,
      this.providerService,
      this.accountNumber,
      this.name,
      this.companyId});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerService = json['provider_service'];
    accountNumber = json['account_number'];
    name = json['name'];
    companyId = json['company_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provider_service'] = this.providerService;
    data['account_number'] = this.accountNumber;
    data['name'] = this.name;
    data['company_id'] = this.companyId;
    return data;
  }
}