import 'package:dio/dio.dart';
import 'package:github_ntf/data/network/apis/repos/github_api.dart';
import 'package:github_ntf/data/network/constants/endpoints.dart';
import 'package:github_ntf/data/network/dio_client.dart';
import 'package:github_ntf/data/network/rest_client.dart';
import 'package:github_ntf/data/sharedpref/contants/preferences.dart';
import 'package:inject/inject.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
class NetworkModule {
  @provide
  @singleton
  Dio provideDio() => Dio()
    ..options.baseUrl = Endpoints.baseUrl
    ..options.connectTimeout = Endpoints.connectionTimeout
    ..options.receiveTimeout = Endpoints.receiveTimeout
    ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
    ..interceptors.add(LogInterceptor(responseBody: true))
    ..interceptors.add(InterceptorsWrapper(onRequest: (Options options) async {
      // getting shared pref instance
      var prefs = await SharedPreferences.getInstance();

      var token = prefs.getString(Preferences.auth_token);

      if (token != null) {
        options.headers.putIfAbsent('Authorization', () => token);
      } else {
        print('Auth token is null');
      }
    }));

  @provide
  @singleton
  DioClient provideDioClient() => DioClient(provideDio());

  @provide
  @singleton
  RestClient provideRestClient() => RestClient();

  @provide
  @singleton
  GithubApi provideGithubApi() =>
      GithubApi(provideDioClient(), provideRestClient());
}
