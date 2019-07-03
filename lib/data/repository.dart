
import 'package:github_ntf/models/repo/repo.dart';
import 'package:github_ntf/models/repo/repo_list.dart';

import 'local/datasources/repo/repo_datasource.dart';
import 'sharedpref/shared_preference_helper.dart';

class Repository {

  final GithubDataSource _githubDataSource;

  final SharedPreferenceHelper _sharedPrefsHelper;

  Repository(this._sharedPrefsHelper, this._githubDataSource);

  Future<RepoList> getRepos() async {
    return await _githubDataSource
        .getReposFromDb()
        .then((repoList) => repoList)
        .catchError((error) => throw error);
  }

  Future<int> insert(Repo repo) => _githubDataSource
      .insert(repo)
      .then((id) => id)
      .catchError((error) => throw error);
}