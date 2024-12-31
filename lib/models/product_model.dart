
class ProductModel {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  ProductModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
