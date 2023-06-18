import 'dart:math';

import 'package:flutter/material.dart';

// class DraggablePoints extends StatefulWidget {
//   @override
//   _DraggablePointsState createState() => _DraggablePointsState();
// }

// class _DraggablePointsState extends State<DraggablePoints> {
//   List<Offset> points = [];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/dot1.jpg'), // Replace with your image path
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Stack(
//         children: [
//           // Display the draggable points
//           for (var point in points)
//             Positioned(
//               left: point.dx - 10,
//               top: point.dy - 10,
//               child: Draggable(
//                 child: CircleAvatar(radius: 10, backgroundColor: Colors.blue),
//                 feedback: CircleAvatar(radius: 10, backgroundColor: Colors.blue.withOpacity(0.5)),
//                 childWhenDragging: Container(),
//                 onDragEnd: (details) {
//                   setState(() {
//                     // Update the position of the dragged point
//                     points[points.indexOf(point)] = details.offset;
//                   });
//                 },
//               ),
//             ),
//           // Add button to create new draggable points
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: EdgeInsets.only(bottom: 20),
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     // Add a new point at the center of the screen
//                     points.add(Offset(
//                       MediaQuery.of(context).size.width / 2,
//                       MediaQuery.of(context).size.height / 2,
//                     ));
//                   });
//                 },
//                 child: Text('Add Point'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class DraggablePoint {
  final Color color;
  Offset position;

  DraggablePoint({required this.color, required this.position});
}

class DraggablePointsScreen extends StatefulWidget {
  @override
  _DraggablePointsScreenState createState() => _DraggablePointsScreenState();
}

class _DraggablePointsScreenState extends State<DraggablePointsScreen> {
  List<DraggablePoint> _points = [];
 double pointSize = 50.0; 
  @override
  void initState() {
    super.initState();
  }

  void _addDraggablePoint(Offset position) {
    setState(() {
      _points.add(DraggablePoint(color: Color.fromARGB(255, 251, 253, 255), position: position));
    });
  }

  void _updatePointPosition(int index, Offset newPosition) {
    setState(() {
      _points[index].position = newPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            GestureDetector(
              onTapDown: (details) {
                _addDraggablePoint(details.localPosition);
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
              ),
            ),
            ..._points.map((point) {
              return Positioned(
                left: point.position.dx,
                top: point.position.dy,
                child: Draggable(
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: point.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  feedback: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: point.color.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                  ),
                  childWhenDragging: Container(),
                  onDraggableCanceled: (velocity, offset) {
                    _updatePointPosition(_points.indexOf(point), offset);
                  },
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
