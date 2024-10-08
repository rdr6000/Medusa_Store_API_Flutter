import '../store/orders/order.dart';
import '../store/others/index.dart';

class StoreCustomersRes {
  Customer? customer;

  StoreCustomersRes.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null ? Customer.fromJson(json["customer"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customer != null) {
      data['customer'] = customer;
    }
    return data;
  }
}

class StoreCustomersListOrdersRes {
  final List<Order>? orders;
  StoreCustomersListOrdersRes(this.orders);
  factory StoreCustomersListOrdersRes.fromJson(json) {
    if (json['orders'] != null) {
      var orders = <Order>[];
      json['orders'].forEach((v) {
        orders.add(Order.fromJson(v));
      });
      return StoreCustomersListOrdersRes(orders);
    }

    return StoreCustomersListOrdersRes(null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders'] = orders?.map((e) => e.toJson()).toList();
    return data;
  }
}

class StoreCustomersOrdersRes {
  final Order order;

  StoreCustomersOrdersRes(this.order);

  factory StoreCustomersOrdersRes.fromJson(Map<String, dynamic> json) {
    return StoreCustomersOrdersRes(
      Order.fromJson(json['order']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order.toJson();
    return data;
  }
}
