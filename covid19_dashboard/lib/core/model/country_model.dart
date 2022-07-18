import 'package:covid19_dashboard/assets/constants.dart';

class Country{
  String? name,slug,iso2;

  Country({
  required  this.name,
  required  this.slug,
  required  this.iso2});

  Country.fromJson(Map<String,dynamic> map ){
    name=map[countryNameKey];
    slug=map[countrySlugKey];
    iso2=map[countryISO2Key];
  }
}