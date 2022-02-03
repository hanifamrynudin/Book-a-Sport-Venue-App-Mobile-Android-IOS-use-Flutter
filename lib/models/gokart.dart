class Gokart{
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
  String info;
  int numberOfKitchen;
  int numberOfBedrooms;
  int numberOfCupboard;

  Gokart({
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
    this.numberOfBedrooms,
    this.numberOfCupboard,
    this.numberOfKitchen,
    this.phone,
    this.photos,
    });

  // static fromJson(item) {}

  Gokart.fromJson(json) {
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
    numberOfBedrooms = json['number_of_gokart'];
    numberOfCupboard = json['number_of_badminton'];
    numberOfKitchen = json['number_of_football'];
  }

}