class ProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  List<String>? images;
  String? brand;
  String? availabilityStatus;
  String thumbnail;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.availabilityStatus,
    this.images,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        category: json['category'] as String?,
        price: (json['price'] as num?)?.toDouble().roundToDouble(),
        discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
        rating: (json['rating'] as num?)?.toDouble(),
        stock: json['stock'] as int?,
        tags:
            (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
    images: (json['images'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
        brand: json['brand'] as String?,
        thumbnail: json['thumbnail'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'tags': tags,
        'brand': brand,
        'thumbnail': thumbnail,
        'images':images
      };
}
