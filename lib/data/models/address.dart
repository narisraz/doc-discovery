import 'package:docdiscovery/domain/entities/address.dart';
import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final String? road;
  final String? city;
  final String? country;
  final String? postcode;

  final DateTime? createdAt;
  final DateTime? modifiedAt;

  const AddressModel({
    this.road,
    this.city,
    this.country,
    this.postcode,
    this.createdAt,
    this.modifiedAt,
  });

  Map<String, dynamic> toJson() {
    final map = {
      'road': road,
      'city': city,
      'country': country,
      'postcode': postcode,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
    };
    map.removeWhere((key, value) => value == null);

    return map;
  }

  static fromJson(Map<String, dynamic> value) {
    return AddressModel(
      road: value['road'],
      city: value['city'],
      country: value['country'],
      postcode: value['postcode'],
      createdAt: value['createdAt']?.toDate(),
      modifiedAt: value['modifiedAt']?.toDate(),
    );
  }

  @override
  List<Object?> get props => [road, city, country, postcode];

  static AddressModel fromAddressEntity(AddressEntity address) {
    return AddressModel(
      road: address.road,
      city: address.city,
      country: address.country,
      postcode: address.postcode,
    );
  }

  AddressEntity toAddressEntity() {
    return AddressEntity(
      road: road,
      city: city,
      country: country,
      postcode: postcode,
    );
  }
}
