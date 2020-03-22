import 'package:coranavirus/model/daily_summary_mdl.dart';
import 'package:coranavirus/utils/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyItemView extends StatelessWidget {
  DailyItemView({Key key, this.data}) : super(key: key);
  final DailySummaryMdl data;
  final oCcy = new NumberFormat("#,##0", "en_US");
  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.black,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.access_time,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                 formatDate( data.reportDateString),
                  style: Theme
                      .of(context)
                      .textTheme
                      .subhead,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.only(left: 32,right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.trending_down,size: 16,color: Colors.green,),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                        "Confirmed : ${oCcy.format(data.totalConfirmed)} ",
                        style: TextStyle(
                             color: Colors.yellow[600]),
                      )),
                  Icon(Icons.trending_up,size: 16,color: Colors.red,),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                        "Recovered : ${oCcy.format(data.totalRecovered!=null?data.totalRecovered:0)} ",
                        style: TextStyle(
                            color: Colors.yellow[600]),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32,right: 16),
              child: Text(
                " Total ${oCcy.format(data.mainlandChina+data.otherLocations)} cases on the World",
              ),
              ),

          ],
        ),
      ),
    );
  }
}
