// A class that represents a crew member model.
// this is how the data looks like:
// "id":550,"cast":[{"adult":false,"gender":2,"id":819,"known_for_department":"Acting","name":"Edward Norton","original_name":"Edward Norton","popularity":30.559,"profile_path":"/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg","cast_id":4,"character":"The Narrator","credit_id":"52fe4250c3a36847f80149f3","order":0},{"adult":false,"gender":2,"

class CrewMember {
  final int id;
  final String name;
  final String profilePath;

  CrewMember({
    required this.id,
    required this.name,
    required this.profilePath,
  });

  factory CrewMember.fromJson(Map<String, dynamic> json) {
    return CrewMember(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'],
    );
  }
}
