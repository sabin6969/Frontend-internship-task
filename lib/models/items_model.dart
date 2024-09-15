class ItemsModel {
  ItemsModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final int? statusCode;
  final String? message;
  final List<Datum> data;

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      statusCode: json["statusCode"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.id,
    required this.itemName,
  });

  final int? id;
  final String? itemName;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      itemName: json["itemName"],
    );
  }
}
