import 'package:flutter/material.dart';
import 'dart:ui';

class Point {
  final double x;
  final double y;
  const Point(this.x, this.y);
}

const points = [
  Point(0.0, 0.0),
  Point(50.0, 50.0),
  Point(300.0, 100.0),
];

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    var radius = 3.0;

    points.forEach(
        (point) => canvas.drawCircle(Offset(point.x, point.y), radius, paint));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theRow = Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      // 可以更換 Colume 為 Row，理解主軸和縱軸設定差別
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("ABC"),
          Text(
            "DEF",
            style: TextStyle(
              fontSize: 40.0,
            ),
          ),
          Text("GHI")
        ],
      ),
    );

    var theColumn = Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      // 可以更換 Colume 為 Row，理解主軸和縱軸設定差別
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("ABC"),
          Text(
            "DEF",
            style: TextStyle(
              fontSize: 40.0,
            ),
          ),
          Text("GHI")
        ],
      ),
    );

    var theWrap = Wrap(
      spacing: 30.0,
      runSpacing: 15.0,
      alignment: WrapAlignment.center,
      children: <Widget>[
        Text("ABCDEFGHIJKLKNPQRSTUVWXYZ" * 1),
        Text("0123456789"),
        Text("零一二三四五六七八九" * 5),
        Text("0123456789"),
      ],
    );

    var theFlex = Container(
      height: 100,
      width: 150,
      margin: const EdgeInsets.all(5.0),
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFF000000),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFFFF0000),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFFFFCC00),
            ),
          ),
        ],
      ),
    );

    var square = Container(
      width: 10,
      height: 10,
      color: Colors.green,
    );

    var theAlignWithAlignment = Container(
      width: 200,
      height: 100,
      margin: const EdgeInsets.all(5.0),
      color: Colors.blue[300],
      child: Align(
        alignment: Alignment(0.0, 0.0),
        child: square,
      ),
    );

    var theAlignWithFractionalOffset = Container(
      width: 200,
      height: 100,
      margin: const EdgeInsets.all(5.0),
      color: Colors.blue[300],
      child: Align(
        alignment: FractionalOffset(0.0, 0.0),
        child: square,
      ),
    );

    var theStack = Container(
      width: 300,
      height: 150,
      color: Colors.blue[300],
      child: Stack(
        // 預設起角左上角，用來控制沒有設定 top、left、button、right 的 widget
        alignment: AlignmentDirectional.topStart,
        children: [
          CustomPaint(
            painter: OpenPainter(),
          ),
          square,
          Positioned(
            top: 0.0,
            left: 12.0,
            child: Column(
              children: [
                Text("alignment: topStart "),
              ],
            ),
          ),
          Positioned(
            top: 50.0,
            left: 50.0,
            child: square,
          ),
          Positioned(
            top: 45.0,
            left: 65.0,
            child: Column(children: [
              Text("top: 50.0"),
              Text("left: 50.0"),
            ]),
          ),
          Positioned(
            bottom: 50.0,
            right: 0.0,
            child: square,
          ),
          Positioned(
            top: 100.0,
            left: 200.0,
            child: Column(children: [
              Text("right: 0.0"),
              Text("botton: 50.0"),
            ]),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Layout")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          theRow,
          theColumn,
          theWrap,
          theFlex,
          theAlignWithAlignment,
          theAlignWithFractionalOffset,
          theStack,
        ],
      ),
    );
  }
}
