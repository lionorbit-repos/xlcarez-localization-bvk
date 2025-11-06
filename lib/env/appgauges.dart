import 'package:XLcarez/env/appexports.dart';

Widget guage({max, min, value,lowstartvalue,lowendvalue,mediumstartvalue,mediumendvalue,highstartvalue,highendvalue}) {
  return SfRadialGauge(
    enableLoadingAnimation: true,
    axes: <RadialAxis>[
      RadialAxis(
        minimum: min ?? 0,
        maximum: max ?? 10,
        canScaleToFit: true,
        ranges: <GaugeRange>[
          GaugeRange(
              startValue: lowstartvalue??0,
              endValue:lowendvalue??6,
              color: success,
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: mediumstartvalue??7,
              endValue: mediumendvalue??20,
              color: Colors.amber,
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: highstartvalue??30,
              endValue:highendvalue??60,
              color: Colors.deepOrange,
              startWidth: 10,
              endWidth: 10),
        ],
        pointers: <GaugePointer>[
          MarkerPointer(
            value: double.tryParse(value.toString()) ?? 0,
            color: Colors.white,
            markerType: MarkerType.circle,
            enableAnimation: false,
            animationType: AnimationType.easeInCirc,
            elevation: 5.0,
            markerHeight: 20,
            markerWidth: 20,
          ),
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: Apptextwidget(value == null ? "0" : value.toString(),
                  style: TxtStls.stl16),
              angle: 90,
              positionFactor: 0)
        ],
        startAngle: 180,
        endAngle: 360,
        showAxisLine: true,
        showLastLabel: true,
      ),
    ],
  );
}

Widget getLinearGauge({min, max, value,List<Color>? colors,interval,List<LinearGaugeRange>? ranges}) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
    margin: const EdgeInsets.all(10),
    child: SfLinearGauge(
        minimum: min ?? 0.0,
        maximum: max ?? 100.0,
        interval: interval,
        orientation: LinearGaugeOrientation.horizontal,
        majorTickStyle: const LinearTickStyle(length: 20),
        axisLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
        showTicks: false,
        showLabels: true,
        labelPosition: LinearLabelPosition.outside,
        ranges: ranges??[],
        markerPointers: [
          LinearShapePointer(
              value: double.tryParse(value.toString()) ?? 0,
              color: primary,
              width: 24,
              position: LinearElementPosition.inside,
              shapeType: LinearShapePointerType.triangle,
              height: 10),
        ],
        // axisTrackStyle: LinearAxisTrackStyle(
        //     gradient: LinearGradient(colors: colors??[success, Colors.amber, errorClr]),
        //     edgeStyle: LinearEdgeStyle.bothFlat,
        //     thickness: 15.0,
        //     borderColor: Colors.grey)
        ),
  );
}
