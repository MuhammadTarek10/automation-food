class OrderModel {
  final String id;
  final String name;
  final String order;
  final double price;
  final double payed;
  final double remaining;

  OrderModel({
    required this.id,
    required this.name,
    required this.order,
    required this.price,
    required this.payed,
    required this.remaining,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      name: json['name'] as String,
      order: json['order'] as String,
      price: json['price'] as double,
      payed: json['payed'] as double,
      remaining: json['remaining'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'order': order,
      'price': price,
      'payed': payed,
      'remaining': remaining,
    };
  }

  static List<OrderModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => OrderModel.fromJson(json)).toList();
  }
}
