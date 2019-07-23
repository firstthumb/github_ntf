import 'dart:async';

import 'package:github_ntf/data/network/constants/endpoints.dart';
import 'package:github_ntf/data/network/dio_client.dart';
import 'package:github_ntf/data/network/rest_client.dart';
import 'package:github_ntf/models/repo/repo_list.dart';

class GithubApi {
  final DioClient _dioClient;

  final RestClient _restClient;

  GithubApi(this._dioClient, this._restClient);

  Future<RepoList> getRepos(String query) async {
    try {
      final res =
          await _dioClient.get(Endpoints.getRepos + Uri.encodeComponent(query));
      return RepoList.fromJson(res["items"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
