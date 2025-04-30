import 'product.dart';

class CartModel {
	int? id;
	List<Product>? products;
	double? total;
	double? discountedTotal;
	int? totalProducts;
	int? totalQuantity;

	CartModel({
		this.id, 
		required this.products,
		this.total, 
		this.discountedTotal, 
		this.totalProducts,
		this.totalQuantity, 
	});

	factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
				id: json['id'] as int?,
				products: (json['products'] as List<dynamic>?)
						?.map((e) => Product.fromJson(e as Map<String, dynamic>))
						.toList(),
				total: (json['total'] as num?)?.toDouble(),
				discountedTotal: (json['discountedTotal'] as num?)?.toDouble(),
				totalProducts: json['totalProducts'] as int?,
				totalQuantity: json['totalQuantity'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'products': products?.map((e) => e.toJson()).toList(),
				'total': total,
				'discountedTotal': discountedTotal,
				'totalProducts': totalProducts,
				'totalQuantity': totalQuantity,
			};
}
