class Person {
  final int id;
  final double popularity;
  final String name;
  final String profileImg;
  final String known;
  final String biography;
  
  Person(this.id,
      this.popularity,
      this.name,
      this.profileImg,
      this.known,
      this.biography);

  Person.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        name = json["name"],
        profileImg = json["profile_path"],
        known = json["known_for_department"],
        biography = json["biography"];
}
