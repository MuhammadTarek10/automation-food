class ConclusionModel {
  final double total;
  final double payed;
  final double remaining;
  final Map<String, int> orderCount;

  const ConclusionModel({
    required this.total,
    required this.payed,
    required this.remaining,
    required this.orderCount
  });

  factory ConclusionModel.fromJson(Map<String, dynamic> json) =>
      ConclusionModel(
        total: json['total'] as double,
        payed: json['payed'] as double,
        remaining: json['remaining'] as double,
        orderCount: json['orderCount'] as Map<String, int>,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'payed': payed,
        'remaining': remaining,
        'orderCount': orderCount,
      };
}
