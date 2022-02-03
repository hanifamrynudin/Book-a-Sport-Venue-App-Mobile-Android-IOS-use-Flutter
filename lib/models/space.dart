import 'package:equatable/equatable.dart';

class Space{
  int id;
  String name;
  String imageUrl;
  int price;
  String city;
  String country;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List photos;
  List fields;
  String info;

  Space({
    this.id, 
    this.name, 
    this.imageUrl, 
    this.city, 
    this.country, 
    this.price, 
    this.rating,
    this.info,
    this.address,
    this.mapUrl,
    this.phone,
    this.photos,
    this.fields,
    });

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    info = json['info'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    fields = json['fields'];
  }
}

class Field extends Equatable {
  final String name;

  Field(this.name);
  
  @override
  List<Object> get props => [name];
}

List<Field> fields = [
  Field("Lapangan 1"),
  Field("Lapangan 2"),
  Field("Lapangan 3"),
];