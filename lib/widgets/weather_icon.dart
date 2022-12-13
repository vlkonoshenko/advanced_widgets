import 'package:flutter/material.dart';

class WeatherIcon extends CustomPainter {
  final double weather;

  WeatherIcon(this.weather) : assert(weather >= 0 && weather <= 1);

  @override
  bool shouldRepaint(WeatherIcon oldDelegate) {
    return weather != oldDelegate.weather;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final sunPaint = Paint();
    sunPaint.color = Colors.yellow.withOpacity(_getSunOpacity(weather));
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height / 3),
      size.height / 2 * 0.5,
      sunPaint,
    );

    final cloudPainter = Paint();
    cloudPainter.color = Colors.grey.shade400;
    canvas.drawRect(
        Rect.fromCircle(
          center: Offset(size.width * 0.5, size.height * 0.6),
          radius: size.height / 4,
        ),
        cloudPainter);

    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.6),
      size.height / 4,
      cloudPainter,
    );

    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.6),
      size.height / 4,
      cloudPainter,
    );

    canvas.drawCircle(
      Offset(size.width * 0.55, size.height * 0.4),
      size.height / 4,
      cloudPainter,
    );

    final widthDrop = size.width / 10;
    final heightDrop = size.height / 10;

    final dropsPainter = Paint();
    dropsPainter.strokeWidth = 5.0;
    dropsPainter.color = Colors.blue.withOpacity(_getDropsOpacity(weather));
    canvas.drawLine(
      Offset(size.width * 0.8, size.height - heightDrop),
      Offset(size.width * 0.8 - widthDrop, size.height),
      dropsPainter,
    );

    canvas.drawLine(
      Offset(size.width * 0.4, size.height - heightDrop),
      Offset(size.width * 0.4 - widthDrop, size.height),
      dropsPainter,
    );
    canvas.drawLine(
      Offset(size.width * 0.6, size.height - heightDrop),
      Offset(size.width * 0.6 - widthDrop, size.height),
      dropsPainter,
    );
  }

  double _getDropsOpacity(double value) {
    if (value < 0.7) {
      return 0;
    }

    return 10 / 3 * value - 7 / 3;
  }

  double _getSunOpacity(double value) {
    if (value > 0.5) {
      return 1;
    } else {
      return 0;
    }
  }
}
