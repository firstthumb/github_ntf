class Repo {
  int id;
  String name;
  String url;
  String description;
  int starCount;

  Repo({
    this.id,
    this.name,
    this.url,
    this.description,
    this.starCount
  });

  factory Repo.fromMap(Map<String, dynamic> json) => Repo(
    id: json["id"],
    name: json["name"],
    url: json["html_url"],
    description: json["description"],
    starCount: json["stargazers_count"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "url": url,
    "description": description,
    "starCount": starCount,
  };
}