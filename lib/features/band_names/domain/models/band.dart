class Band {
  final String name;
  String id;
  int votes;

  Band({required this.name, this.id = '', this.votes = 0});

  factory Band.fromJson(Map<String, dynamic> json) =>
      Band(name: json['name'], id: json['id'], votes: json['votes']);
}
