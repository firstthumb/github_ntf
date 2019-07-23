class Endpoints {
  Endpoints._();

  static const String baseUrl = "https://api.github.com/search";

  static const int receiveTimeout = 5000;

  static const int connectionTimeout = 3000;

  static const String getRepos = baseUrl + "/repositories?q=";
}
