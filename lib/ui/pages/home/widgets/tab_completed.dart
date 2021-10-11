import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/state_manager.dart';
import 'package:school_tasks/controllers/home_controller.dart';

class TabCompleted extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.completedTasks.length,
        itemBuilder: (context, index) {
          final task = controller.completedTasks[index];

          return FocusedMenuHolder(
            onPressed: () {},
            blurSize: 0,
            duration: Duration(milliseconds: 100),
            openWithTap: false,
            menuItems: [
              FocusedMenuItem(
                title: Text('Marcar como pendiente'),
                trailingIcon: Icon(Icons.pending_actions),
                onPressed: () => controller.markAsPending(task),
              ),
              FocusedMenuItem(
                title: Text('Eliminar', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.redAccent,
                trailingIcon: Icon(Icons.delete, color: Colors.white),
                onPressed: () => controller.deleteTask(task),
              ),
            ],
            child: InkWell(
              onTap: (){},
              child: ListTile(
                title: Text(task.subject),
                subtitle: Text(task.task),
              ),
            ),
          );
        },
      ),
    );
  }
}
