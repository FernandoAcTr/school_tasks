import 'package:get/get.dart';
import 'package:school_tasks/bindings/create_task_binding.dart';
import 'package:school_tasks/bindings/home_binding.dart';
import 'package:school_tasks/ui/pages/create_task/create_task_page.dart';
import 'package:school_tasks/ui/pages/home/home_page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ADD_TASK,
      page: () => CreateTaskPage(),
      binding: CreateTaskBinding(),
    ),
  ];
}
