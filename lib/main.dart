import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:github_ntf/di/modules/netwok_module.dart';
import 'package:github_ntf/routes.dart';
import 'package:github_ntf/ui/home/home.dart';
import 'package:inject/inject.dart';

import 'constants/app_theme.dart';
import 'constants/strings.dart';
import 'di/components/app_component.dart';
import 'di/modules/local_module.dart';

var appComponent;

void main() {
  debugPaintSizeEnabled = false;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    appComponent = await AppComponent.create(NetworkModule(), LocalModule());

    runApp(appComponent.app);
  });
}

@provide
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: themeData,
      routes: Routes.routes,
      home: HomeScreen(),
    );
  }
}
