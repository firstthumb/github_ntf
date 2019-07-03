import 'package:github_ntf/data/repository.dart';
import 'package:github_ntf/models/repo/repo_list.dart';
import 'package:github_ntf/stores/error/error_store.dart';
import 'package:github_ntf/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

import 'package:github_ntf/main.dart';

part 'repo_store.g.dart';

class RepoStore = _RepoStore with _$RepoStore;

abstract class _RepoStore implements Store {

  Repository repository = appComponent.getRepository();

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // store variables:-----------------------------------------------------------
  @observable
  RepoList repoList;

  @observable
  bool success = false;

  @observable
  bool loading = false;

  // actions:-------------------------------------------------------------------
  @action
  Future getRepos() async {
    loading = true;

    repository.getRepos().then((repoList) {
      this.repoList = repoList;
      loading = false;
      success = true;
      errorStore.showError = false;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.showError = true;
      errorStore.errorMessage = DioErrorUtil.handleError(e);
      print(e);
    });
  }
}