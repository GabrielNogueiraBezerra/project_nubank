import 'package:project/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/home/home_page.dart';
import 'package:project/app/modules/home/repository/repository_client.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HomeController(i.get<RepositoryCliente>()),
        ),
        Bind(
          (i) => RepositoryCliente(),
        )
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
