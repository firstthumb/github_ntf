class Repo {
  String name;
  int id;

  Repo({
    this.name,
    this.id,
  });

  factory Repo.fromMap(Map<String, dynamic> json) => Repo(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "id": id,
  };
}