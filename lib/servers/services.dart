
import 'package:covid19_traker_bloc/models/country_detail.dart';
import 'package:covid19_traker_bloc/models/country_summary.dart';
import 'package:covid19_traker_bloc/models/global_summary.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CovidService {

  Future<GlobalSummaryModel> getGlobalSummary() async {
    final data = await http.Client().get(
        Uri.parse("https://api.covid19api.com/summary"));

    if (data.statusCode != 200)
      throw Exception();

    GlobalSummaryModel summary = new GlobalSummaryModel.fromJson(
        json.decode(data.body));
    return summary;
  }

  Future<CountrySummaryModel> getCountrySummary() async {
    final data = await http.Client().get(
        Uri.parse("https://disease.sh/v3/covid-19/countries/vietnam"));

    if (data.statusCode != 200)
      throw Exception();

    CountrySummaryModel summaryList = new CountrySummaryModel.fromJson(jsonDecode(data.body));
    return summaryList;
  }
  Future<List<CountrySummaryChartModel>?> getCoronaCountries() async {
    var response =  await http.Client().get(Uri.parse("https://api.covid19api.com/total/dayone/country/vietnam"));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<CountrySummaryChartModel>? countries = CoronaCountryList.fromJson(data).countries;
      return countries;
    } else {
      throw Exception();
    }
  }
  List<CountryDetail> countries(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CountryDetail>((json) =>CountryDetail.fromJson(json)).toList();
  }
  Future<List<CountryDetail>> getCountryDetail() async {
    var response =  await http.Client().get(Uri.parse("https://disease.sh/v3/covid-19/countries"));
    if (response.statusCode == 200) {
      return countries(response.body);
    } else {
      throw Exception();
    }
  }
  List<CountryDetail> getFilteredCountries(String text, List<CountryDetail>? countries) {
    if (countries!.length == 0) {
      return [];
    } else {
      List<CountryDetail> list = countries.where((country) => country.country.toLowerCase().contains(text.trim().toLowerCase()))
          .toList();
      return list;
    }
  }
}