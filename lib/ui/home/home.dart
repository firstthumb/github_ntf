import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_ntf/models/repo/repo.dart';
import 'package:github_ntf/stores/repo/repo_store.dart';
import 'package:github_ntf/widgets/progress_indicator_widget.dart';
import 'package:github_ntf/widgets/repository_search_widget.dart';
import 'package:github_ntf/widgets/repository_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //store
  final _store = RepoStore();
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //get all posts
    _store.getRepos("dart");
    _searchTextController.addListener(() {
      if (_searchTextController.text.length > 2) {
        _store.getRepos(_searchTextController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildSearchField(context),),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RepositorySearchWidget(
            textController: _searchTextController,
          ),
          Expanded(
            child: _buildSearchResult(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResult() {
    return Stack(
      children: <Widget>[
        Observer(
          builder: (context) {
            return _store.loading
                ? CustomProgressIndicatorWidget()
                : Material(child: _buildListView());
          },
        ),
        Observer(
          name: 'error',
          builder: (context) {
            return _store.success
                ? Container()
                : showErrorMessage(context, _store.errorStore.errorMessage);
          },
        )
      ],
    );
  }

  Widget _buildListView() {
    return _store.repoList != null
        ? ListView.separated(
      itemCount: _store.repoList.repos.length,
      separatorBuilder: (context, position) {
        return Divider();
      },
      itemBuilder: (context, position) {
        return RepositoryWidget(
          repo: _store.repoList.repos[position],
          onLike: () => _onLike(_store.repoList.repos[position]),
        );
      },
    )
        : Center(child: Text('No posts found'));
  }

  void _onLike(Repo repo) {

  }

  // General Methods:-----------------------------------------------------------
  showErrorMessage(BuildContext context, String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message != null) {
        FlushbarHelper.createError(
          message: message,
          title: 'Error',
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return Container();
  }
}
