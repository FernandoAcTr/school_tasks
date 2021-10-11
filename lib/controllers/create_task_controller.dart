import 'package:get/state_manager.dart';
import 'package:school_tasks/data/models/task.dart';
import 'package:school_tasks/data/repositories/task_repository.dart';

class CreateTaskController extends GetxController {
  final TaskRepository taskRepository;

  CreateTaskController({required this.taskRepository});

  //state
  final _selectedDate = DateTime.now().obs;

  DateTime get selectedDate => _selectedDate.value;
  set selectedDate(DateTime value) => _selectedDate.value = value;

  Future<void> addTask(Task task) async {
    await taskRepository.insert(task);
  }

  Future<void> editTask(Task task) async {
    await taskRepository.update(task);
  }
}
