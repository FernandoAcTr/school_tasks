import 'package:get/get.dart';
import 'package:school_tasks/data/models/task.dart';
import 'package:school_tasks/data/repositories/task_repository.dart';

class HomeController extends GetxController {
  final TaskRepository taskRepository;

  HomeController({required this.taskRepository});

  //state
  final _pendindTasks = <Task>[].obs;
  final _completedTasks = <Task>[].obs;
  final _loading = false.obs;

  bool get loading => _loading.value;
  List<Task> get pendingTasks => _pendindTasks;
  List<Task> get completedTasks => _completedTasks;

  @override
  void onInit() {
    fetchPendingTasks();
    fetchCompletedTasks();
    super.onInit();
  }

  void fetchPendingTasks() async {
    _loading.value = true;
    final tasks = await taskRepository.findAll();
    _pendindTasks.assignAll(tasks);
    _loading.value = false;
  }

  void fetchCompletedTasks() async {
    _loading.value = true;
    final tasks = await taskRepository.findAll(completed: 1);
    _completedTasks.assignAll(tasks);
    _loading.value = false;
  }

  void deleteTask(Task task) async {
    await taskRepository.delete(task);
    _pendindTasks.removeWhere((t) => t.id == task.id);
    _completedTasks.removeWhere((t) => t.id == task.id);
  }

  Future<void> markAsCompleted(Task task) async {
    await taskRepository.update(task.copyWith(completed: 1));
    _pendindTasks.removeWhere((t) => t.id == task.id);
    _completedTasks.add(task);
  }

  Future<void> markAsPending(Task task) async {
    await taskRepository.update(task.copyWith(completed: 0));
    _completedTasks.removeWhere((t) => t.id == task.id);
    _pendindTasks.add(task);
  }
}
