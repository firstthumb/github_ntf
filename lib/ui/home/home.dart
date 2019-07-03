import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_ntf/data/sharedpref/contants/preferences.dart';
import 'package:github_ntf/stores/repo/repo_store.dart';
import 'package:github_ntf/widgets/progress_indicator_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //store
  final _store = RepoStore();

  @override
  void initState() {
    super.initState();

    //get all posts
    _store.getRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Repos'),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            SharedPreferences.getInstance().then((preference) {
              preference.setBool(Preferences.is_logged_in, false);
            });
          },
          icon: Icon(
            Icons.power_settings_new,
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
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
        return ListTile(
          leading: Icon(Icons.cloud_circle),
          title: Text(
            '${_store.repoList.repos[position].name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Text(
            '${_store.repoList.repos[position].name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        );
      },
    )
        : Center(child: Text('No posts found'));
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
