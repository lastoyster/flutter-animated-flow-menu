import 'package:flutter/material.dart';

const double buttonSize = 60;

class LinearFlowWidget extends StatefulWidget {
  @override
  State<LinearFlowWidget> createState() => _LinearFlowWidgetState();
}

class _LinearFlowWidgetState extends State<LinearFlowWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Flow(
        delegate: FlowMenuDelegate(controller: controller),
        children: <IconData>[
          Icons.menu,
          Icons.mail, // 0
          Icons.call, // 1
          Icons.notifications, // 2
        ].map<Widget>(buildItem).toList(),
      );

  Widget buildItem(IconData icon) => SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: FloatingActionButton(
          elevation: 0,
          splashColor: Colors.black,
          child:
