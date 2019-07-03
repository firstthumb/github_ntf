import 'package:github_ntf/models/repo/repo.dart';

class RepoList {
  final List<Repo> repos;

  RepoList({
    this.repos,
  });

  factory RepoList.fromJson(List<dynamic> json) {
    List<Repo> repos = List<Repo>();
    repos = json.map((repo) => Repo.fromMap(repo)).toList();

    return RepoList(repos: repos);
  }
}