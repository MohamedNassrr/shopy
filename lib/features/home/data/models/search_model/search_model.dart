

class SearchModel {
  int? id;
  String? title;

  SearchModel({
    this.id,
    this.title,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
