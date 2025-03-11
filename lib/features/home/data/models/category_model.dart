class CategoryModel {
  String? slug;
  String name;
  String? url;

  CategoryModel({this.slug, required this.name, this.url});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        slug: json['slug'] as String?,
        name: json['name'] as String,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'slug': slug,
        'name': name,
        'url': url,
      };
}
