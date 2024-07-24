import 'customer_billing_address.dart';

class StorePostCustomersCustomerReq {
  BillingAddress? billingAddress;
  String? email;
  String? firstName;
  String? lastName;
  Map<String, dynamic>? metadata;
  String? password;
  String? phone;

  StorePostCustomersCustomerReq({
    this.billingAddress,
    this.email,
    this.firstName,
    this.lastName,
    this.metadata,
    this.password,
    this.phone,
  });

  StorePostCustomersCustomerReq.fromJson(Map<String, dynamic> json) {
    billingAddress = json['billing_address'] != null ? BillingAddress.fromJson(
        json['billing_address']) : null;
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    metadata = json['metadata'];
    password = json['password'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (billingAddress != null) {
      data['billing_address'] = billingAddress?.toJson();
    }
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    if (metadata != null) {
      data['metadata'] = metadata;
    }
    data['password'] = password;
    data['phone'] = phone;
    return data;
  }
}
