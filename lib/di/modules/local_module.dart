import 'dart:async';

import 'package:github_ntf/data/local/datasources/repo/repo_datasource.dart';
import 'package:github_ntf/data/repository.dart';
import 'package:github_ntf/data/sharedpref/shared_preference_helper.dart';
import 'package:github_ntf/di/modules/netwok_module.dart';
import 'package:inject/inject.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
class LocalModule extends NetworkModule {
  @provide
  @singleton
  @asynchronous
  Future<SharedPreferences> provideSharedPreferences() async =>
      await SharedPreferences.getInstance();

  @provide
  @singleton
  SharedPreferenceHelper provideSharedPreferenceHelper() =>
      SharedPreferenceHelper(provideSharedPreferences());

  @provide
  @singleton
  @asynchronous
  Future<Database> provideDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();

    final dbPath = join(appDocumentDir.path, "a");

    var database = await databaseFactoryIo.openDatabase(dbPath);

    return database;
  }

  @provide
  @singleton
  GithubDataSource provideGithubDataSource() => GithubDataSource(provideDatabase());

  @provide
  @singleton
  Repository provideRepository() =>
      Repository(provideGithubApi(), provideSharedPreferenceHelper(),
          provideGithubDataSource());


}
