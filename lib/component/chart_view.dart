import 'package:charts_flutter/flutter.dart' as charts;
import 'package:coranavirus/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartView extends StatelessWidget {
  ChartView({Key key, @required this.title, this.summarys, this.ordinalSales})
      : super(key: key);
  final String title;
  final List<Summary> summarys;
  final List<OrdinalSales> ordinalSales;

  List<Widget> buildSummaryView() {
    var wids = <Widget>[];
    summarys.asMap().forEach((i, item) {
      wids.add(Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.key),
            Text(item.value),
          ],
        ),
      ));
    });

    return wids;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black12)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 4, bottom: 4),
                  child: Text("5y"),
                ),
              ),
              Icon(
                Icons.arrow_drop_up,
                color: Colors.green,
              ),
              Text(
                "500m",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            child: charts.BarChart(
              _createData(),
              animate: true,
              secondaryMeasureAxis: charts.NumericAxisSpec(
                  tickFormatterSpec: simpleCurrencyFormatter),
              defaultRenderer: new charts.BarRendererConfig(
                  // By default, bar renderer will draw rounded bars with a constant
                  // radius of 100.
                  // To not have any rounded corners, use [NoCornerStrategy]
                  // To change the radius of the bars, use [ConstCornerStrategy]
                  cornerStrategy: const charts.ConstCornerStrategy(3)),
            ),
          ),
          Column(
            children: buildSummaryView(),
          ),
        ],
      ),
    );
  }

  final simpleCurrencyFormatter =
      new charts.BasicNumericTickFormatterSpec.fromNumberFormat(
          new NumberFormat.compactSimpleCurrency(locale: "id"));

  /// Create one series with sample hard coded data.
  List<charts.Series<OrdinalSales, String>> _createData() {
    final purple = charts.ColorUtil.fromDartColor(HexColor("#A093E6"));
    final purple1 = charts.ColorUtil.fromDartColor(HexColor("#8A77D8"));
    final purple2 = charts.ColorUtil.fromDartColor(HexColor("#6C54CF"));
    final purple3 = charts.ColorUtil.fromDartColor(HexColor("#3E5295"));
    final purple4 = charts.ColorUtil.fromDartColor(HexColor("#343872"));

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (segment, __) {
          switch (segment.year) {
            case "2015":
              {
                return purple;
              }
            case "2016":
              {
                return purple1;
              }
            case "2017":
              {
                return purple2;
              }
            case "2018":
              {
                return purple3;
              }
            case "2019":
              {
                return purple4;
              }
            default:
              {
                return purple4;
              }
          }
        },
        measureFn: (OrdinalSales sales, _) => sales.sales,
        domainFn: (OrdinalSales sales, _) => sales.year,
        data: ordinalSales,
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }
}

const secondaryMeasureAxisId = 'secondaryMeasureAxisId';

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class Summary {
  final String key;
  final String value;

  Summary(this.key, this.value);
}
