import 'package:covid19_traker_bloc/blocs/country_detail/bloc.dart';
import 'package:covid19_traker_bloc/blocs/country_detail/event.dart';
import 'package:covid19_traker_bloc/blocs/country_detail/state.dart';
import 'package:covid19_traker_bloc/components/component/counter_detail.dart';
import 'package:covid19_traker_bloc/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CountryDetail extends StatefulWidget {
  const CountryDetail({Key? key}) : super(key: key);

  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  //late List<CountryDetail>? countryDetail;
  late CountryDetailBloc countryDetailBloc;
  ScrollController _scrollController = ScrollController();
  List<CountryDetail> list = []; // for filtering
  TextEditingController searchTextCntrlr = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    countryDetailBloc = BlocProvider.of<CountryDetailBloc>(context);
    countryDetailBloc.add(fetchCountryDetail());
    //countryDetail = List.generate(20, (index) => countryDetailBloc.add(fetchCountryDetail()));
    /*_scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        countryDetailBloc.add(fetchCountryDetail());
      }
    });*/
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BlocBuilder<CountryDetailBloc, CountryDetailState>(
              builder: (context, state) {
                if(state is CountryDetailLoading) {
                  return Center(child:  CircularProgressIndicator());
                }
                if(state is CountryDetailFailure) {
                  return Center(
                    child: Text('Cannot load comments from Server', style: TextStyle(fontSize: 22, color: Colors.red),),
                  );
                }
                if(state is CountryDetailLoaded) {
                  return Container(child: ListView.builder(
                    shrinkWrap: true,
                  itemCount: state.countryDetail!.length,
                    physics: const BouncingScrollPhysics(),
                    controller: _scrollController,
                    itemBuilder:(context,index){
                      return Card(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        elevation: 3,
                        shadowColor: kShadowColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: kBackgroundColor,
                        child: ExpansionTile(
                          title: Row(
                            children: <Widget>[
                              Text('${index + 1}'),
                              Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                      ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    state.countryDetail![index].country,
                                    overflow: TextOverflow.fade,
                                    style: kTitleTextstyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      CounterDetail(
                                        color: kInfectedColor,
                                        title: "Nhiễm bệnh",
                                        number: state.countryDetail![index].cases,
                                      ),
                                      CounterDetail(
                                        color: kRecovercolor,
                                        number: state.countryDetail![index].recovered,
                                        title: "Hồi phục",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      CounterDetail(
                                        color: kPrimaryColor,
                                        number: state.countryDetail![index].active,
                                        title: "Đang điều trị",
                                      ),
                                      CounterDetail(
                                        color: kDeathColor,
                                        number: state.countryDetail![index].deaths,
                                        title: "Tử vong",
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  );
                }
                return Center(child: Text('Other states..'));//never run this line, only fix warning.
              },
            ),
          ],
        ),
      ),
    );
  }
}
