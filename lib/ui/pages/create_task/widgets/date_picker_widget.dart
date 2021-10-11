import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_tasks/controllers/create_task_controller.dart';

class DatePickerWidget extends GetView<CreateTaskController> {
  final TextEditingController textController;

  DatePickerWidget({required this.textController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextFormField(
            readOnly: true,
            controller: textController,
            onTap: () => _selectDate(context),
            decoration: InputDecoration(
              labelText: 'Fecha de entrega',
            ),
            validator: (value) {
              if (value?.isEmpty == true) return 'El campo es obligatorio';
            },
          ),
        ),
        Icon(Icons.arrow_drop_down),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final date = DateTime.now();
    final maxDate = DateTime(date.year + 3);
    final picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: maxDate,
    );
    if (picked != null) {
      controller.selectedDate = picked;
      textController.text = DateFormat.yMMMMEEEEd('es_MX').format(picked);
    }
  }
}
