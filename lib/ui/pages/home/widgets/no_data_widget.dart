import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final text;

  const NoDataWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ListView(
        children: [
          Container(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(child: Text(text)),
          )
        ],
      );
    });
  }
}
