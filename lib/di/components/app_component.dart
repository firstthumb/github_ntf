import 'package:github_ntf/data/repository.dart';
import 'package:github_ntf/di/modules/local_module.dart';
import 'package:inject/inject.dart';
import 'package:github_ntf/main.dart';

import 'app_component.inject.dart' as g;

@Injector(const [LocalModule])
abstract class AppComponent {
  @provide
  MyApp get app;

  static Future<AppComponent> create(
      LocalModule localModule,
      ) async {
    return await g.AppComponent$Injector.create(
      localModule,
    );
  }

  @provide
  Repository getRepository();
}
