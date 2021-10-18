/// Flutter code sample for Draggable

// The following example has a [Draggable] widget along with a [DragTarget]
// in a row demonstrating an incremented `acceptedData` integer value when
// you drag the element to the target.

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();


}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    List<TableRow> desk = [];

    for (int i = 0; i < 8; i++) {
      List<Widget>? row = [];

      for (int j = 0; j < 8; j++) {
        row.add(myWidget(context));
      }
      desk.add(TableRow(children: row));
    }

    return Table(children: desk);
  }


  Widget myWidget(BuildContext context) {
    return DragTarget<int>(
      builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
          ) {
        return Draggable<int>(
          // Data is the value this Draggable stores.
          data: 1,
          child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/queen.png"),
          ),
          feedback: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/queen.png"),
          ),
          childWhenDragging: Container(),
        );
      },
    );
  }
}