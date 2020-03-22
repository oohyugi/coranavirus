/// confirmed : {"value":156400,"detail":"https://covid19.mathdro.id/api/confirmed"}
/// recovered : {"value":73968,"detail":"https://covid19.mathdro.id/api/recovered"}
/// deaths : {"value":5833,"detail":"https://covid19.mathdro.id/api/deaths"}
/// dailySummary : "https://covid19.mathdro.id/api/daily"
/// dailyTimeSeries : {"pattern":"https://covid19.mathdro.id/api/daily/[dateString]","example":"https://covid19.mathdro.id/api/daily/2-14-2020"}
/// image : "https://covid19.mathdro.id/api/og"
/// source : "https://github.com/mathdroid/covid19"
/// countries : "https://covid19.mathdro.id/api/countries"
/// countryDetail : {"pattern":"https://covid19.mathdro.id/api/countries/[country]","example":"https://covid19.mathdro.id/api/countries/USA"}
/// lastUpdate : "2020-03-15T07:33:03.000Z"

class MainMdl {
  ConfirmedBean confirmed;
  RecoveredBean recovered;
  DeathsBean deaths;
  String dailySummary;
  DailyTimeSeriesBean dailyTimeSeries;
  String image;
  String source;
  String countries;
  CountryDetailBean countryDetail;
  String lastUpdate;

  static MainMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MainMdl mainMdlBean = MainMdl();
    mainMdlBean.confirmed = ConfirmedBean.fromMap(map['confirmed']);
    mainMdlBean.recovered = RecoveredBean.fromMap(map['recovered']);
    mainMdlBean.deaths = DeathsBean.fromMap(map['deaths']);
    mainMdlBean.dailySummary = map['dailySummary'];
    mainMdlBean.dailyTimeSeries =
        DailyTimeSeriesBean.fromMap(map['dailyTimeSeries']);
    mainMdlBean.image = map['image'];
    mainMdlBean.source = map['source'];
    mainMdlBean.countries = map['countries'];
    mainMdlBean.countryDetail = CountryDetailBean.fromMap(map['countryDetail']);
    mainMdlBean.lastUpdate = map['lastUpdate'];
    return mainMdlBean;
  }

  Map toJson() => {
        "confirmed": confirmed,
        "recovered": recovered,
        "deaths": deaths,
        "dailySummary": dailySummary,
        "dailyTimeSeries": dailyTimeSeries,
        "image": image,
        "source": source,
        "countries": countries,
        "countryDetail": countryDetail,
        "lastUpdate": lastUpdate,
      };
}

/// pattern : "https://covid19.mathdro.id/api/countries/[country]"
/// example : "https://covid19.mathdro.id/api/countries/USA"

class CountryDetailBean {
  String pattern;
  String example;

  static CountryDetailBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CountryDetailBean countryDetailBean = CountryDetailBean();
    countryDetailBean.pattern = map['pattern'];
    countryDetailBean.example = map['example'];
    return countryDetailBean;
  }

  Map toJson() => {
        "pattern": pattern,
        "example": example,
      };
}

/// pattern : "https://covid19.mathdro.id/api/daily/[dateString]"
/// example : "https://covid19.mathdro.id/api/daily/2-14-2020"

class DailyTimeSeriesBean {
  String pattern;
  String example;

  static DailyTimeSeriesBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DailyTimeSeriesBean dailyTimeSeriesBean = DailyTimeSeriesBean();
    dailyTimeSeriesBean.pattern = map['pattern'];
    dailyTimeSeriesBean.example = map['example'];
    return dailyTimeSeriesBean;
  }

  Map toJson() => {
        "pattern": pattern,
        "example": example,
      };
}

/// value : 5833
/// detail : "https://covid19.mathdro.id/api/deaths"

class DeathsBean {
  int value;
  String detail;

  static DeathsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DeathsBean deathsBean = DeathsBean();
    deathsBean.value = map['value'];
    deathsBean.detail = map['detail'];
    return deathsBean;
  }

  Map toJson() => {
        "value": value,
        "detail": detail,
      };
}

/// value : 73968
/// detail : "https://covid19.mathdro.id/api/recovered"

class RecoveredBean {
  int value;
  String detail;

  static RecoveredBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    RecoveredBean recoveredBean = RecoveredBean();
    recoveredBean.value = map['value'];
    recoveredBean.detail = map['detail'];
    return recoveredBean;
  }

  Map toJson() => {
        "value": value,
        "detail": detail,
      };
}

/// value : 156400
/// detail : "https://covid19.mathdro.id/api/confirmed"

class ConfirmedBean {
  int value;
  String detail;

  static ConfirmedBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ConfirmedBean confirmedBean = ConfirmedBean();
    confirmedBean.value = map['value'];
    confirmedBean.detail = map['detail'];
    return confirmedBean;
  }

  Map toJson() => {
        "value": value,
        "detail": detail,
      };
}
