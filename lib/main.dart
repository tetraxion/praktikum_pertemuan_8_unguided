import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OnPan App'),
        ),
        body: Column(
          children: [
            Container(
              height: 100,
            ),
            PanDrag(),
          ],
        ),
      ),
    );
  }
}

class PanDrag extends StatefulWidget {
  const PanDrag({super.key});
  @override
  State<PanDrag> createState() => _PanDragState();
}

class _PanDragState extends State<PanDrag> {
  // ignore: unused_field
  bool _dragging = false;
  Offset _move = Offset.zero;
  // ignore: unused_field
  int _DragCount = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        print(details);
        setState(() {
          _move = Offset.zero;
          _dragging = true;
        });
      },
      onPanUpdate: (DragUpdateDetails details) {
        print(details);
        setState(() {
          _move += details.delta;
        });
      },
      onPanEnd: (DragEndDetails details) {
        print("Sudah Di Update");
        print(details);
        setState(() {
          _dragging = false;
          _DragCount++;
        });
      },
      child: Container(
        color: Colors.red,
        height: 200,
        width: 200,
        child: Center(
          child: Transform.translate(offset: _move),
        ),
      ),
    );
  }
}
