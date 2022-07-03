/*class CountryDetailList {
  List<CountryDetail> countriesDetail;

  CountryDetailList({required this.countriesDetail});

  CountryDetailList.fromJson(List<dynamic> parsedJson) {
    if (parsedJson != null) {
      countriesDetail = <CountryDetail>[];
      countriesDetail = parsedJson.map((i) => CountryDetail.fromJson(i)).toList();
    }
  }
}*/
class CountryDetail {
  final String country;
  final String flag;
  var cases;
  var todayCases;
  var deaths;
  var todayDeaths;
  var recovered;
  var critical;
  var active;
  var casesPerOneMillion;

  CountryDetail(this.country,
      this.flag,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.critical,
      this.active,
      this.casesPerOneMillion,);

//sử dụng từ khóa factory khi triển khai một hàm tạo không phải lúc nào cũng tạo một phiên bản mới của lớp
  factory CountryDetail.fromJson(Map<String, dynamic> json) {
    return CountryDetail(
      json["country"],
      json['flag'],
      json['cases'],
      json['todayCases'],
      json['deaths'],
      json['todayDeaths'],
      json['recovered'],
      json['critical'],
      json['active'],
      json['casesPerOneMillion'],
    );
  }
}