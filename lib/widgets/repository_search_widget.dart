import 'package:flutter/material.dart';
import 'package:github_ntf/models/repo/repo.dart';

class RepositorySearchWidget extends StatelessWidget {
  final TextEditingController textController;

  final Repo repo;

  const RepositorySearchWidget({
    Key key,
    this.repo,
    this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        controller: textController,
        keyboardType: TextInputType.text,
        style: Theme.of(context).textTheme.body1,
        decoration: InputDecoration(
            hintText: 'hint',
            hintStyle:
                Theme.of(context).textTheme.body1.copyWith(color: Colors.grey),
            counterText: '',
            icon: Icon(Icons.search, color: Colors.blue)),
      ),
    );
  }
}
