import 'package:github_ntf/data/network/apis/repos/github_api.dart';
import 'package:github_ntf/models/repo/repo.dart';
import 'package:github_ntf/models/repo/repo_list.dart';

import 'local/datasources/repo/repo_datasource.dart';
import 'sharedpref/shared_preference_helper.dart';

class Repository {

  final GithubDataSource _githubDataSource;

  final GithubApi _githubApi;

  final SharedPreferenceHelper _sharedPrefsHelper;

  Repository(this._githubApi, this._sharedPrefsHelper, this._githubDataSource);

  Future<RepoList> getRepos(String query) async {
//    return await _githubDataSource
//        .getReposFromDb()
//        .then((repoList) => repoList)
//        .catchError((error) => throw error);
    return await _githubApi.getRepos(query).then((repoList) {
      repoList.repos.forEach((repo) {
        // Do insert
      });

      return repoList;
    }).catchError((error) => throw error);
  }

  Future<int> insert(Repo repo) => _githubDataSource
      .insert(repo)
      .then((id) => id)
      .catchError((error) => throw error);
}