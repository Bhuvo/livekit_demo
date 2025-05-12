import 'package:flutter/material.dart';

class DottedRect extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final Color? color;
  final Function()? onTap;
  const DottedRect({
    super.key,
    this.width,
    this.height,
    this.child, this.color, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final boxWidth = width ?? screenSize.width;
    final boxHeight = height ?? 200.0;

    return Center(
      child: InkWell(
        onTap:onTap,
        child: CustomPaint(
          size: Size(boxWidth, boxHeight),
          painter: DottedRectPainter(color: color),
          child: SizedBox(
            width: boxWidth,
            height: boxHeight,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}

class DottedRectPainter extends CustomPainter {
  final Color? color;
  const DottedRectPainter({this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ??Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5;
    const dashSpace = 3;

    void drawDottedLine(Offset start, Offset end) {
      final totalLength = (end - start).distance;
      final direction = (end - start) / totalLength;
      double currentLength = 0;

      while (currentLength < totalLength) {
        final from = start + direction * currentLength;
        final to = start + direction * (currentLength + dashWidth).clamp(0, totalLength);
        canvas.drawLine(from, to, paint);
        currentLength += dashWidth + dashSpace;
      }
    }


    // Draw dotted rectangle
    final topLeft = Offset(0, 0);
    final topRight = Offset(size.width, 0);
    final bottomLeft = Offset(0, size.height);
    final bottomRight = Offset(size.width, size.height);

    drawDottedLine(topLeft, topRight);
    drawDottedLine(topRight, bottomRight);
    drawDottedLine(bottomRight, bottomLeft);
    drawDottedLine(bottomLeft, topLeft);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}