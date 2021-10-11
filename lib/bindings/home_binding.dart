import 'package:get/get.dart';
import 'package:school_tasks/controllers/home_controller.dart';
import 'package:school_tasks/data/database/db_helper.dart';
import 'package:school_tasks/data/repositories/task_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        taskRepository: TaskRepository(DBHelper()),
      ),
    );
  }
}
