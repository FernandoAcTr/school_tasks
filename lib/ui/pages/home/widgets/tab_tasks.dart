import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_tasks/controllers/home_controller.dart';
import 'package:school_tasks/ui/pages/home/widgets/task_widget.dart';
import 'package:school_tasks/ui/pages/home/widgets/no_data_widget.dart';
import 'package:school_tasks/ui/routes/pages.dart';

class TabTasks extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading) return Center(child: CircularProgressIndicator());
      if (controller.pendingTasks.isEmpty) return NoDataWidget(text: 'No tienes tareas pendientes');
      return _buildTaskList();
    });
  }

  Widget _buildTaskList() {
    return ListView.builder(
      itemCount: controller.pendingTasks.length,
      itemBuilder: (context, index) {
        final task = controller.pendingTasks[index];
        final taskDate = DateTime.parse(task.dateLimit);
        final expired = taskDate.compareTo(DateTime.now());

        return TaskWidget(
          index: index,
          task: task,
          expired: expired < 0,
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd)
              controller.deleteTask(task);
            else
              controller.markAsCompleted(task);
          },
          onEditPress: () =>
              Get.toNamed(Routes.ADD_TASK, arguments: task)?.whenComplete(() => controller.fetchPendingTasks()),
        );
      },
    );
  }
}
