import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_tasks/controllers/create_task_controller.dart';
import 'package:school_tasks/data/models/task.dart';
import 'package:school_tasks/ui/pages/create_task/widgets/date_picker_widget.dart';

class CreateTaskPage extends GetView<CreateTaskController> {
  final _formKey = GlobalKey<FormState>();
  final _controllerSubject = TextEditingController();
  final _controllerTask = TextEditingController();
  final _controllerDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    Task? oldTask;
    if (arguments != null) {
      oldTask = arguments as Task;
      _controllerSubject.text = oldTask.subject;
      _controllerTask.text = oldTask.task;
      _controllerDate.text = oldTask.dateLimit;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(oldTask == null ? 'Agregar Tarea' : 'Editar Tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Materia',
                  labelText: 'Materia',
                ),
                controller: _controllerSubject,
                validator: (value) {
                  print(value?.isEmpty);
                  if (value?.isEmpty == true) return 'El campo es obligatorio';
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Detalle de la Tarea',
                  labelText: 'Tarea',
                ),
                controller: _controllerTask,
                validator: (value) {
                  if (value?.isEmpty == true) return 'El campo es obligatorio';
                },
              ),
              SizedBox(height: 20),
              DatePickerWidget(textController: _controllerDate),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;

                  final subject = _controllerSubject.text;
                  final description = _controllerTask.text;
                  final dateLimit = DateFormat('yyyy-MM-dd').format(controller.selectedDate);
                  if (oldTask == null) {
                    await controller
                        .addTask(Task(subject: subject, task: description, dateLimit: dateLimit, completed: 0));
                  } else {
                    await controller.editTask(oldTask.copyWith(
                      dateLimit: dateLimit,
                      task: description,
                      subject: subject,
                    ));
                  }

                  Get.back();
                },
                child: Text('Guardar Tarea'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
