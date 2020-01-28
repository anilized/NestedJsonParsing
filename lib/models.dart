class Person {
  final String id;
  final String name;
  final int age;
  final List<String> places;
  final List<Images> images;
  final Address address;

  Person({this.id, this.name,this.age, this.places, this.images, this.address});

  factory Person.fromJson(Map<String, dynamic> json){
    return Person(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      places: pasrsePlaces(json['places']),
      images: parseImages(json),  // json['places'],
      address:Address.fromJson(json['address'])
    );
  }

  static List<String> pasrsePlaces(placesJson){
    List<String> placesList = new List<String>.from(placesJson);
    return placesList;
  }

  static List<Images> parseImages(imagesJson){
    var list =imagesJson['images'] as List;
    List<Images> imagesList =
        list.map((data) => Images.fromJson(data)).toList();
        return imagesList;
  }
}

class Images {
  int id;
  String name;
  Images({this.id,this.name});
  
  factory Images.fromJson(Map<String,dynamic> parsedJson){
    return Images(id: parsedJson['id'], name: parsedJson['name']);
  }
}

class Details{
  int houseNo;
  String town;

  Details({this.houseNo, this.town});

  factory Details.fromJson(Map<String, dynamic> json){
    return Details(
      houseNo: json['house_no'] as int,
      town: json['town'],
    );
  }
}

class Address{
  final String streetNo;
  final Details details;

  Address({this.streetNo, this.details});

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      streetNo: json['street_no'] as String,
      details: Details.fromJson(json['details']),
    );
  }
}

class Album{
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Album({this.albumId, this.id, this.thumbnailUrl, this.title, this.url});

  factory Album.fromJson(Map<String, dynamic> json){
    return Album(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}