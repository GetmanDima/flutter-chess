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
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Draggable<int>(
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
        ),
        DragTarget<int>(
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
          onAccept: (int data) {
            setState(() {
              acceptedData = data;
            });
          },
        ),
      ],
    );
  }
}
