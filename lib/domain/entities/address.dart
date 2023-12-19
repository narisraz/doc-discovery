import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String road;
  final String city;
  final String country;
  final String postcode;

  const Address(
      {this.road = '', this.city = '', this.country = '', this.postcode = ''});

  @override
  List<Object?> get props => [road, city, country, postcode];
}
