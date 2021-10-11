import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_tasks/controllers/home_controller.dart';
import 'package:school_tasks/ui/pages/home/widgets/tab_completed.dart';
import 'package:school_tasks/ui/pages/home/widgets/tab_tasks.dart';
import 'package:school_tasks/ui/routes/pages.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('School Tasks'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.pending_actions)),
              Tab(icon: Icon(Icons.task_alt_sharp)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.ADD_TASK)?.whenComplete(() => controller.fetchPendingTasks()),
          child: Icon(Icons.add),
        ),
        body: TabBarView(
          children: [
            TabTasks(),
            TabCompleted(),
          ],
        ),
      ),
    );
  }
}
