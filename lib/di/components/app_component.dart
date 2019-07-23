import 'package:github_ntf/data/repository.dart';
import 'package:github_ntf/di/modules/local_module.dart';
import 'package:github_ntf/di/modules/netwok_module.dart';
import 'package:github_ntf/main.dart';
import 'package:inject/inject.dart';

import 'app_component.inject.dart' as g;

@Injector(const [NetworkModule, LocalModule])
abstract class AppComponent {
  @provide
  MyApp get app;

  static Future<AppComponent> create(NetworkModule networkModule,
      LocalModule localModule,
      ) async {
    return await g.AppComponent$Injector.create(
      networkModule,
      localModule,
    );
  }

  @provide
  Repository getRepository();
}
