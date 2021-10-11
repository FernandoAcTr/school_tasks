import 'package:get/get.dart';
import 'package:school_tasks/controllers/create_task_controller.dart';
import 'package:school_tasks/data/database/db_helper.dart';
import 'package:school_tasks/data/repositories/task_repository.dart';

class CreateTaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTaskController>(
      () => CreateTaskController(taskRepository: TaskRepository(DBHelper())),
    );
  }
}
