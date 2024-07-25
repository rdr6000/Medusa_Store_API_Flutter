import 'country.dart';
import 'customer.dart';

class Address {
  /// Id of the address
  ///
  /// Example: "addr_01G8ZC9VS1XVE149MGH2J7QSSH"
  final String? id;

  /// Id of the customer this address belongs to
  ///
  /// Example: "cus_01G2SG30J8C85S4A5CHM2S1NS2"
  final String? customer_id;

  /// The details of the customer.
  final List<Customer>? customer;

  /// Company name
  ///
  /// Example: "Acme"
  final String? company;

  /// First name
  ///
  /// Example: "Arno"
  final String? first_name;

  /// Last name
  ///
  /// Example: "Willms"
  final String? last_name;

  /// Address line 1
  ///
  /// Example: "14433 Kemmer Court"
  final String? address_1;

  /// Address line 2
  ///
  /// Example: "Suite 369"
  final String? address_2;

  /// City
  ///
  /// Example: "South Geoffreyview"
  final String? city;

  final Country? country;

  /// The 2 character iso code of the country in lower case
  ///
  /// Example: "st"
  final String? country_code;

  /// Province
  ///
  /// Example: "Kentucky"
  final String? province;

  /// Postal code
  ///
  /// Example: 72093
  final String? postal_code;

  /// Phone number
  ///
  /// Example: 16128234334802
  final String? phone;

  /// The date with timezone at which the resource was created.
  final DateTime? created_at;

  /// The date with timezone at which the resource was updated.
  final DateTime? updated_at;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deleted_at;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  Address({
    this.id,
    this.customer_id,
    this.customer,
    this.company,
    this.first_name,
    this.last_name,
    this.address_1,
    this.address_2,
    this.city,
    this.country,
    this.country_code,
    this.province,
    this.postal_code,
    this.phone,
    this.created_at,
    this.updated_at,
    this.deleted_at,
    this.metadata,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    List<Customer>? customer;

    if (json['customer'] != null) {
      customer = <Customer>[];
      json['customer'].forEach(
        (element) => customer!.add(
          Customer.fromJson(element),
        ),
      );
    }

    return Address(
      id: json['id'],
      customer_id: json['customer_id'],
      company: json['company'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      customer: customer,
      address_1: json['address_1'],
      address_2: json['address_2'],
      city: json['city'],
      country:
          json['country'] != null ? Country.fromJson(json['country']) : null,
      country_code: json['country_code'],
      province: json['province'],
      postal_code: json['postal_code'],
      phone: json['phone'],
      created_at: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updated_at: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deleted_at: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (id != null) {
      json['id'] = id;
    }

    if (customer_id != null) {
      json['customer_id'] = customer_id;
    }

    if (customer != null) {
      json['customer'] = customer?.map((e) => e.toJson()).toList();
    }

    if (company != null) {
      json['company'] = company;
    }

    if (first_name != null) {
      json['first_name'] = first_name;
    }

    if (last_name != null) {
      json['last_name'] = last_name;
    }

    if (address_1 != null) {
      json['address_1'] = address_1;
    }

    if (address_2 != null) {
      json['address_2'] = address_2;
    }

    if (city != null) {
      json['city'] = city;
    }

    if (country_code != null) {
      json['country_code'] = country_code;
    }

    if (country != null) {
      json['country'] = country?.toJson();
    }

    if (province != null) {
      json['province'] = province;
    }

    if (postal_code != null) {
      json['postal_code'] = postal_code;
    }

    if (phone != null) {
      json['phone'] = phone;
    }

    if (created_at != null) {
      json['created_at'] = created_at.toString();
    }
    if (updated_at != null) {
      json['updated_at'] = updated_at.toString();
    }

    if (deleted_at != null) {
      json['deleted_at'] = deleted_at.toString();
    }

    if (metadata != null) {
      json['metadata'] = metadata;
    }

    return json;
  }
}
