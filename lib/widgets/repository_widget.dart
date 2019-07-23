import 'package:flutter/material.dart';
import 'package:github_ntf/models/repo/repo.dart';

class RepositoryWidget extends StatelessWidget {
  final VoidCallback onLike;

  final Repo repo;

  const RepositoryWidget({Key key, this.repo, this.onLike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: _Item(context),
      ),
    );
  }

  Widget _Item(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 16.0),
            child: CircleAvatar(child: Text(repo.name[0])),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(repo.name, style: Theme.of(context).textTheme.subhead),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(repo.name),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onLike,
            child: Container(
              margin: EdgeInsets.only(left: 16.0, right: 10.0),
              child: Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
