import 'package:covid19_dashboard/assets/constants.dart';

class GlobalSummary {
  int? newConfirmed,totalConfirmed,newDeaths,newRecovered,totalRecovered,totalDeaths;
  DateTime? date;

  GlobalSummary(
     this.newConfirmed,
     this.totalConfirmed,
     this.newDeaths,
     this.newRecovered,
     this.totalRecovered,
     this.totalDeaths,
     this.date);



  GlobalSummary.fromJson(Map<String,dynamic> map ){
    newConfirmed=          map[globalNewConfirmedKey   ];
    totalConfirmed=        map[globalTotalConfirmedKey ];
    newDeaths=             map[globalNewDeathsKey      ];
    newRecovered=          map[globalNewRecoveredKey    ];
    totalRecovered=        map[globalTotalRecoveredKey   ];
    totalDeaths=        map[globalTotalDeathsKey   ];
    date = DateTime.parse(map[globalDateKey]);
    }




}








