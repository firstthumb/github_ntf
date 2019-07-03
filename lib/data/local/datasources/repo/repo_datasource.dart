import 'package:github_ntf/models/repo/repo.dart';
import 'package:github_ntf/models/repo/repo_list.dart';
import 'package:sembast/sembast.dart';

class GithubDataSource {
  final _githubStore = intMapStoreFactory.store("a");

  final Future<Database> _db;

  GithubDataSource(this._db);

  Future<int> insert(Repo repo) async {
    return await _githubStore.add(await _db, repo.toMap());
  }

  Future<int> count() async {
//    return await _githubStore.count(await _db);
    return 1;
  }

  Future<RepoList> getReposFromDb() async {
    var repoList;

//    final recordSnapshots = await _githubStore.find(await _db);
//
//    if(recordSnapshots.length > 0) {
//      repoList = RepoList(
//        repos: recordSnapshots.map((snapshot) {
//          final repo = Repo.fromMap(snapshot.value);
//          repo.id = snapshot.key;
//          return repo;
//        }).toList()
//      );
//    }

    var list = new List<Repo>.generate(10, (i) => Repo(name: "name $i", id: i));

    repoList = RepoList(
      repos: list
    );
    
    return repoList;
  }
}