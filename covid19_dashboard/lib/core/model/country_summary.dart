import 'package:covid19_dashboard/assets/constants.dart';

class CountrySummary {
  String? countryCode;
  String? countryName;
  int? cases;
  int? totalConfirmed, totalDeaths, totalRecovered;
  int? confirmed, deaths, recovered;
  int? newConfirmed, newDeaths, newRecovered;
  DateTime? date;

  CountrySummary(
      this.countryCode,this.countryName,
      this.totalConfirmed, this.totalDeaths, this.totalRecovered,
      this.confirmed,
      this.deaths,
      this.cases,
      this.recovered,
      this.newConfirmed,
      this.newDeaths,
      this.newRecovered,
      this.date);

  CountrySummary.fromJson(Map<String, dynamic> map) {
    countryCode = map[countryCodeKey];
    countryName = map[countryNameKey];
    cases = map[casesKey];

    totalConfirmed = map[globalTotalConfirmedKey];
    totalDeaths = map[globalTotalDeathsKey];
    totalRecovered = map[globalTotalRecoveredKey];

    confirmed = map[confirmedKey];
    deaths = map[deathsKey];
    recovered = map[recoveredKey];

    newConfirmed = map[globalNewConfirmedKey];
    newDeaths =    map[globalNewDeathsKey];
    newRecovered = map[globalNewRecoveredKey];
    date = DateTime.parse(map[globalDateKey]);
  }
}
