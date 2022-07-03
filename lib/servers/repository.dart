import 'package:covid19_traker_bloc/models/country_summary.dart';
import 'package:covid19_traker_bloc/models/global_summary.dart';
import 'package:covid19_traker_bloc/servers/services.dart';
import 'package:covid19_traker_bloc/models/country_detail.dart';
class CoronaRepository{
  CovidService covidService;
  CoronaRepository({required this.covidService});
  Future<GlobalSummaryModel> fetchCorona() async{
    return await covidService.getGlobalSummary();
  }
  Future<CountrySummaryModel> fetchCoronaCountries() async{
    return await covidService.getCountrySummary();
  }
  Future<List<CountrySummaryChartModel>?> fetchCoronaCountriesSummary() async{
    return await covidService.getCoronaCountries();
  }
  Future<List<CountryDetail>> fetchCountryDetail() async{
    return await covidService.getCountryDetail();
  }
  List<CountryDetail> fetchFilteredCountries(String text, List<CountryDetail> list) {
    return covidService.getFilteredCountries(text, list);
  }
}