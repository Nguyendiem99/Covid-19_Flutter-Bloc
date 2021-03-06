import 'package:covid19_traker_bloc/components/component/counter.dart';
import 'package:covid19_traker_bloc/constants.dart';
import 'package:covid19_traker_bloc/models/country_summary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryStatisticsNew extends StatelessWidget {
  final CountrySummaryModel summaryNewList;

  CountryStatisticsNew({required this.summaryNewList});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Counter(
                      color: kInfectedColor,
                      number: summaryNewList.cases,
                      subtitle: summaryNewList.todayCases,
                      title: "Nhiễm bệnh",
                    ),
                    const SizedBox(height: 10),
                    Counter(
                      color: kPrimaryColor,
                      number: summaryNewList.active,
                      subtitle: 0,
                      title: "Đang điều trị",
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Counter(
                      color: kRecovercolor,
                      number: summaryNewList.recovered,
                      subtitle: summaryNewList.todayRecovered,
                      title: "Hồi phục",
                    ),
                    const SizedBox(height: 10),
                    Counter(
                      color: kDeathColor,
                      number: summaryNewList.deaths,
                      subtitle: summaryNewList.todayDeaths,
                      title: "Tử vong",
                    ),
                  ],
                ),
              ],
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Cập nhật: "
                    '${DateFormat("dd/MM - HH:mm").format(DateTime.fromMillisecondsSinceEpoch(summaryNewList.updated))}',
                style: kDescribeStyle,
              ),
              InkWell(
                child: Text.rich(
                  TextSpan(
                    text: 'Nguồn: ',
                    children: [
                      TextSpan(
                        text: 'Bộ Y Tế, WHO',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
