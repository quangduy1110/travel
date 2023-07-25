class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String location;
  String description;

  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        people: json["people"],
        img: json["img"],
        location: json["location"],
      );
}
