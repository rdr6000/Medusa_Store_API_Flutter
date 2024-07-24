class BillingAddress {
  String? firstName;
  String? lastName;
  String? phone;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? countryCode;
  String? province;
  String? postalCode;
  Map<String, dynamic>? metadata;

  BillingAddress({
    this.firstName,
    this.lastName,
    this.phone,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.countryCode,
    this.province,
    this.postalCode,
    this.metadata,
  });

  BillingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    countryCode = json['country_code'];
    province = json['province'];
    postalCode = json['postal_code'];
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['company'] = company;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['city'] = city;
    data['country_code'] = countryCode;
    data['province'] = province;
    data['postal_code'] = postalCode;
    if (metadata != null) {
      data['metadata'] = metadata;
    }
    return data;
  }
}
