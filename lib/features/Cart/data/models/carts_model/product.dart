class Product {
	int id;
	String? title;
	double? price;
	int quantity;
	double? total;
	double? discountPercentage;
	int? discountedPrice;
	String? thumbnail;

	Product({
		required this.id,
		this.title,
		this.price, 
		required this.quantity,
		this.total,
		this.discountPercentage, 
		this.discountedPrice, 
		this.thumbnail,
	});

	factory Product.fromJson(Map<String, dynamic> json) => Product(
				id: json['id'] as int,
				title: json['title'] as String?,
				price: (json['price'] as num?)?.toDouble(),
				quantity: json['quantity'] as int,
				total: (json['total'] as num?)?.toDouble(),
				discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
				discountedPrice: json['discountedPrice'] as int?,
				thumbnail: json['thumbnail'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'title': title,
				'price': price,
				'quantity': quantity,
				'total': total,
				'discountPercentage': discountPercentage,
				'discountedPrice': discountedPrice,
				'thumbnail': thumbnail,
			};
}
