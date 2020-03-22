class ConfirmedMdl {
  String provinceState;
  String countryRegion;
  int lastUpdate;
  dynamic lat;
  dynamic long;
  int confirmed;
  int recovered;
  int deaths;
  int active;
  String iso2;
  String iso3;

  static ConfirmedMdl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ConfirmedMdl confirmedMdlBean = ConfirmedMdl();
    confirmedMdlBean.provinceState = map['provinceState'];
    confirmedMdlBean.countryRegion = map['countryRegion'];
    confirmedMdlBean.lastUpdate = map['lastUpdate'];
    confirmedMdlBean.lat = map['lat'];
    confirmedMdlBean.long = map['long'];
    confirmedMdlBean.confirmed = map['confirmed'];
    confirmedMdlBean.recovered = map['recovered'];
    confirmedMdlBean.deaths = map['deaths'];
    confirmedMdlBean.active = map['active'];
    confirmedMdlBean.iso2 = map['iso2'];
    confirmedMdlBean.iso3 = map['iso3'];
    return confirmedMdlBean;
  }

  Map toJson() => {
    "provinceState": provinceState,
    "countryRegion": countryRegion,
    "lastUpdate": lastUpdate,
    "lat": lat,
    "long": long,
    "confirmed": confirmed,
    "recovered": recovered,
    "deaths": deaths,
    "active": active,
    "iso2": iso2,
    "iso3": iso3,
  };
}