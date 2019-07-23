// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$RepoStore on _RepoStore, Store {
  final _$repoListAtom = Atom(name: '_RepoStore.repoList');

  @override
  RepoList get repoList {
    _$repoListAtom.reportObserved();
    return super.repoList;
  }

  @override
  set repoList(RepoList value) {
    _$repoListAtom.context.checkIfStateModificationsAreAllowed(_$repoListAtom);
    super.repoList = value;
    _$repoListAtom.reportChanged();
  }

  final _$successAtom = Atom(name: '_RepoStore.success');

  @override
  bool get success {
    _$successAtom.reportObserved();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.context.checkIfStateModificationsAreAllowed(_$successAtom);
    super.success = value;
    _$successAtom.reportChanged();
  }

  final _$loadingAtom = Atom(name: '_RepoStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.checkIfStateModificationsAreAllowed(_$loadingAtom);
    super.loading = value;
    _$loadingAtom.reportChanged();
  }

  final _$getReposAsyncAction = AsyncAction('getRepos');

  @override
  Future<dynamic> getRepos(String query) {
    return _$getReposAsyncAction.run(() => super.getRepos(query));
  }
}
