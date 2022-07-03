import 'package:covid19_traker_bloc/blocs/corona_country/bloc.dart';
import 'package:covid19_traker_bloc/blocs/corona_country/event.dart';
import 'package:covid19_traker_bloc/blocs/corona_country/state.dart';
import 'package:covid19_traker_bloc/blocs/corona_country_summary/bloc.dart';
import 'package:covid19_traker_bloc/blocs/corona_country_summary/event.dart';
import 'package:covid19_traker_bloc/blocs/corona_country_summary/state.dart';
import 'package:covid19_traker_bloc/components/country_static_chart.dart';
import 'package:covid19_traker_bloc/components/country_statistics.dart';
import 'package:covid19_traker_bloc/components/my_header.dart';
import 'package:covid19_traker_bloc/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class InfiniteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfiniteList();
}
class _InfiniteList extends State<InfiniteList> {
  late CoronaCountriesBloc coronaCountriesBloc;
  late CoronaCountriesSummaryBloc coronaCountriesSummaryBloc;
  //scroll controller
  final controller = ScrollController();
  double offset = 1;
  @override
  void initState() {
    super.initState();
    coronaCountriesBloc = BlocProvider.of<CoronaCountriesBloc>(context);
    coronaCountriesSummaryBloc = BlocProvider.of<CoronaCountriesSummaryBloc>(context);
    coronaCountriesBloc.add(fetchCoronaCountriesEvent());
    coronaCountriesSummaryBloc.add(fetchCoronaCountriesSummaryEvent());
  }
  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                BlocBuilder<CoronaCountriesBloc, CoronaCountriesState>(
                  builder: (context, state) {
                    if(state is CoronaCountriesLoading) {
                      return Center(child:  CircularProgressIndicator());
                    }
                    if(state is CoronaCountriesLoadFailure) {
                      return Center(
                        child: Text('Cannot load comments from Server', style: TextStyle(fontSize: 22, color: Colors.red),),
                      );
                    }
                    if(state is CoronaCountriesLoaded) {
                      return Column(
                        children: <Widget>[
                          MyHeader(
                            image: "assets/icons/Drcorona.svg",
                            textTop: "Ở nhà là\nYÊU NƯỚC",
                            offset: offset,
                          ),
                          Text(
                            "Thông tin tai Viet Nam",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kTitleTextColor,
                            ),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Thông tin dịch bệnh",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: kTitleTextColor,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                  },
                                  child: Text(
                                    "Xem chi tiết",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          CountryStatisticsNew(summaryNewList: state.countries),
                        ],
                      );
                    }
                    return Center(child: Text('Other states..'));//never run this line, only fix warning.
                  },
                ),
                SingleChildScrollView(
                  child: BlocBuilder<CoronaCountriesSummaryBloc, CoronaCountriesSummaryState>(
                    builder: (context, state) {
                      if(state is CoronaCountriesSummaryLoading) {
                        return Center(child:  CircularProgressIndicator());
                      }
                      if(state is CoronaCountriesSummaryLoadFailure) {
                        return Center(
                          child: Text('Cannot load comments from Server', style: TextStyle(fontSize: 22, color: Colors.red),),
                        );
                      }
                      if(state is CoronaCountriesSummaryLoaded) {
                        return CountryStatistics(summaryChartList:state.countries,);
                      }
                      return Center(child: Text('Other states..'));//never run this line, only fix warning.
                    },
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}