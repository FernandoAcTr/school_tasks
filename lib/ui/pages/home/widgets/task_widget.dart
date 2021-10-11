import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_tasks/data/models/task.dart';

typedef void DismissCallback(DismissDirection direction);

class TaskWidget extends StatelessWidget {
  final DismissCallback? onDismissed;
  final int index;
  final Task task;
  final VoidCallback? onEditPress;
  final bool expired;

  const TaskWidget({
    this.onDismissed,
    required this.index,
    required this.task,
    this.onEditPress,
    this.expired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecond.toString()),
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: AlignmentDirectional.centerStart,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: AlignmentDirectional.centerEnd,
        child: Icon(Icons.check, color: Colors.white),
      ),
      child: Card(
        color: this.expired ? Colors.red[100] : Colors.white,
        child: ListTile(
          title: Text(task.subject, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.task),
              Text("Vence: ${DateFormat.yMMMMEEEEd('es_MX').format(DateTime.parse(task.dateLimit))}"),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: onEditPress,
          ),
        ),
      ),
      onDismissed: onDismissed,
      confirmDismiss: (direction) async {
        bool result = true;
        if (direction == DismissDirection.startToEnd) {
          result = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text('¿Estas Seguro?'),
              actions: [
                TextButton(
                  child: Text('Sí, eliminar'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () => Navigator.of(context).pop(false),
                )
              ],
            ),
          );
        }

        return result;
      },
    );
  }
}
