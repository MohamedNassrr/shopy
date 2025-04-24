import 'address_component.dart';
import 'geometry.dart';
import 'navigation_point.dart';

class GeoCodingModel {
	List<AddressComponent>? addressComponents;
	String? formattedAddress;
	Geometry? geometry;
	List<NavigationPoint>? navigationPoints;
	String? placeId;
	List<String>? types;

	GeoCodingModel({
		this.addressComponents, 
		this.formattedAddress, 
		this.geometry, 
		this.navigationPoints, 
		this.placeId, 
		this.types, 
	});

	factory GeoCodingModel.fromJson(Map<String, dynamic> json) {
		return GeoCodingModel(

			formattedAddress: json['formatted_address'] as String?,
			geometry: json['geometry'] == null
						? null
						: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
			navigationPoints: (json['navigation_points'] as List<dynamic>?)
						?.map((e) => NavigationPoint.fromJson(e as Map<String, dynamic>))
						.toList(),
			placeId: json['place_id'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'address_components': addressComponents?.map((e) => e.toJson()).toList(),
				'formatted_address': formattedAddress,
				'geometry': geometry?.toJson(),
				'navigation_points': navigationPoints?.map((e) => e.toJson()).toList(),
				'place_id': placeId,
				'types': types,
			};
}
