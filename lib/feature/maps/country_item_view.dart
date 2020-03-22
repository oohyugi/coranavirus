import 'package:coranavirus/model/confirmed_mdl.dart';
import 'package:coranavirus/model/daily_summary_mdl.dart';
import 'package:coranavirus/utils/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryItemView extends StatelessWidget {
  CountryItemView({Key key, this.data, this.onTap}) : super(key: key);
  final ConfirmedMdl data;
  final oCcy = new NumberFormat("#,##0", "en_US");
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 1,
        color: Theme.of(context).backgroundColor,
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
                    Icons.place,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    data.provinceState==null?data.countryRegion:data.provinceState,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32,right: 16),
                child: Text(
                  "Confirmed : ${oCcy.format(data.confirmed)} ",
                  style: TextStyle(color: Colors.yellow[600]),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                margin: EdgeInsets.only(left: 32, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Expanded(
                        child: Text(
                      "Recovered : ${oCcy.format(data.recovered)} ",
                      style: TextStyle(color: Colors.green[600]),
                    )),

                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: Text(
                      "Deaths : ${oCcy.format(data.deaths != null ? data.deaths : 0)} ",
                      style: TextStyle(color: Colors.red[600]),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
