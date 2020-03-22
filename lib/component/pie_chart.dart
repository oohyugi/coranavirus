import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PieOutsideLabelChart extends StatelessWidget {
  final List<LinearSales> linearSales;
  final bool animate;

  PieOutsideLabelChart(this.linearSales, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
//  factory PieOutsideLabelChart.withSampleData() {
//    return new PieOutsideLabelChart(
//      _createSampleData(),
//      // Disable animations for image tests.
//      animate: false,
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(_createData(),
        animate: animate,
        // Add an [ArcLabelDecorator] configured to render labels outside of the
        // arc with a leader line.
        //
        // Text style for inside / outside can be controlled independently by
        // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
        //
        // Example configuring different styles for inside/outside:
        //       new charts.ArcLabelDecorator(
        //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 24));
  }

  List<charts.Series<LinearSales, String>> _createData() {
    return [
      new charts.Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.status,
        measureFn: (LinearSales sales, _) => sales.totalCase,
        data: linearSales,
        colorFn: (segment,__){
          switch (segment.status) {
            case "Confirmed":
              {
                return charts.ColorUtil.fromDartColor(Colors.yellow[600]);
              }
            case "Death":
              {
                return charts.ColorUtil.fromDartColor(Colors.red[600]);
              }
            case "Recovered":
              {
                return charts.ColorUtil.fromDartColor(Colors.green[600]);
              }

            default:
              {
                return charts.ColorUtil.fromDartColor(Colors.blue);
              }
          }
        },
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) =>
            '${row.status}: ${row.totalCase}',
      )
    ];
  }
}

class LinearSales {
  final String status;
  final int totalCase;

  LinearSales(this.status, this.totalCase);
}
