import 'package:flutter/widgets.dart';

import 'constants.dart';

class HolePainter extends CustomPainter {
  HolePainter({
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    this.overlayShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    this.hole,
    this.center,
    this.animation,
    this.fullscreen = true,
    this.overlayColor = const Color(0xaa000000),
  });

  /// By default, the value is
  /// ```
  /// RoundedRectangleBorder(
  ///   borderRadius: BorderRadius.all(Radius.circular(8.0)),
  /// )
  /// ````
  final ShapeBorder shape;

  /// By default, the value is
  /// ```
  /// RoundedRectangleBorder(
  ///   borderRadius: BorderRadius.all(Radius.circular(8.0)),
  /// )
  /// ````
  final ShapeBorder overlayShape;
  final Rect? hole;
  final double? animation;

  /// By default, value is `Color(0xaa000000)`
  final Color? overlayColor;
  final Offset? center;

  /// By default value is `true`
  final bool fullscreen;

  @override
  bool hitTest(Offset position) {
    print("hitTest - ${hole?.contains(position)}");
    return !(hole?.contains(position) ?? false);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Path canvasPath = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final Path holePath = shape.getOuterPath(hole ?? Rect.zero);
    final Rect overlayRect =
        EdgeInsets.all(size.width * kOverlayRatio * animation!).inflateRect(
      hole ??
          Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: 0.0,
          ),
    );
    final Path overlayPath = overlayShape.getOuterPath(overlayRect);

    Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addPath(holePath, Offset.zero)
      ..fillType = PathFillType.evenOdd;
    if (!fullscreen) {
      path = Path.combine(
        PathOperation.difference,
        overlayPath,
        holePath,
      );
    }

    canvas.drawPath(
      path,
      Paint()
        ..color = overlayColor!
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(HolePainter oldDelegate) =>
      hole != oldDelegate.hole ||
      animation != oldDelegate.animation ||
      overlayColor != oldDelegate.overlayColor;
}
