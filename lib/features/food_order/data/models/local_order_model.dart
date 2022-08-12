class LocalOrderModel {
  final String id;
  final String name;
  final String order;
  final double price;
  final double payed;
  final double remaining;
  int done;

  LocalOrderModel({
    required this.id,
    required this.name,
    required this.order,
    required this.price,
    required this.payed,
    required this.remaining,
    required this.done,
  });

  factory LocalOrderModel.fromJson(Map<String, dynamic> json) {
    return LocalOrderModel(
      id: json['id'] as String,
      name: json['name'] as String,
      order: json['order'] as String,
      price: json['price'] as double,
      payed: json['payed'] as double,
      remaining: json['remaining'] as double,
      done: json['done'] as int,
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
      'done': done,
    };
  }

  static List<LocalOrderModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => LocalOrderModel.fromJson(json)).toList();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalOrderModel && order == other.order && price == other.price;

  @override
  int get hashCode => order.hashCode ^ price.hashCode;
}
