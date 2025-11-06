// ignore_for_file: library_private_types_in_public_api, unused_local_variable

import 'dart:math';

import 'appexports.dart';

class DashedOvalTimer extends StatefulWidget {
  final Widget centerWidget; // Widget to be placed inside the oval

  const DashedOvalTimer({super.key, required this.centerWidget});

  @override
  _DashedOvalTimerState createState() => _DashedOvalTimerState();
}

class _DashedOvalTimerState extends State<DashedOvalTimer> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Provider.of<MeasurementModel>(context, listen: false).init();
    });
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Provider.of<MeasurementModel>(context, listen: false).canceltimer();
      });
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MeasurementModel>(builder: (context, ctrl, child) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // The dashed oval timer with widget inside
              Stack(
                alignment:
                    Alignment.center, // Center the widget inside the oval
                children: [
                  // CustomPaint for dashed oval
                  CustomPaint(
                    painter: DashedOvalPainter(ctrl.dashColors),
                    size: const Size(380, 500), // Size of the oval
                  ),
                  // The widget passed as the child of the DashedOvalTimer
                  ClipPath(
                    clipper: OvalClipper(),
                    child: SizedBox(
                      width: 330,
                      height: 450,
                      child: widget.centerWidget,
                    ),
                  ),
                  //widget.centerWidget,
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

class OvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromLTWH(
        0, 0, size.width, size.height)); // Create an oval using width & height
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DashedOvalPainter extends CustomPainter {
  final List<Color> dashColors;

  DashedOvalPainter(this.dashColors);

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5.0; // Width of each dash
    double dashSpacing = 4.0; // Space between dashes

    // Calculate the angle step for each dash
    int dashCount = dashColors.length;
    double angleStep = 2 * pi / dashCount;

    // Define paint for drawing the dashes
    Paint paint = Paint()
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < dashCount; i++) {
      paint.color = dashColors[i];

      // Calculate start and end points for each dash
      double angle = i * angleStep;
      double xStart = size.width / 2 + (size.width / 2) * cos(angle);
      double yStart = size.height / 2 + (size.height / 2) * sin(angle);
      double xEnd = size.width / 2 + (size.width / 2 - dashWidth) * cos(angle);
      double yEnd =
          size.height / 2 + (size.height / 2 - dashWidth) * sin(angle);

      canvas.drawLine(Offset(xStart, yStart), Offset(xEnd, yEnd), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
