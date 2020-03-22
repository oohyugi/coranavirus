class DailySummaryMdl {
  int reportDate;
  int mainlandChina;
  int otherLocations;
  int totalConfirmed;
  int totalRecovered;
  String reportDateString;
  int deltaConfirmed;
  dynamic deltaRecovered;
  int objectid;

  static DailySummaryMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DailySummaryMdl dailySummaryMdlBean = DailySummaryMdl();
    dailySummaryMdlBean.reportDate = map['reportDate'];
    dailySummaryMdlBean.mainlandChina = map['mainlandChina'];
    dailySummaryMdlBean.otherLocations = map['otherLocations'];
    dailySummaryMdlBean.totalConfirmed = map['totalConfirmed'];
    dailySummaryMdlBean.totalRecovered = map['totalRecovered'];
    dailySummaryMdlBean.reportDateString = map['reportDateString'];
    dailySummaryMdlBean.deltaConfirmed = map['deltaConfirmed'];
    dailySummaryMdlBean.deltaRecovered = map['deltaRecovered'];
    dailySummaryMdlBean.objectid = map['objectid'];
    return dailySummaryMdlBean;
  }

  Map toJson() => {
    "reportDate": reportDate,
    "mainlandChina": mainlandChina,
    "otherLocations": otherLocations,
    "totalConfirmed": totalConfirmed,
    "totalRecovered": totalRecovered,
    "reportDateString": reportDateString,
    "deltaConfirmed": deltaConfirmed,
    "deltaRecovered": deltaRecovered,
    "objectid": objectid,
  };
}