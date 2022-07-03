import 'package:covid19_traker_bloc/blocs/corona_summary/bloc.dart';
import 'package:covid19_traker_bloc/blocs/corona_summary/event.dart';
import 'package:covid19_traker_bloc/blocs/corona_summary/state.dart';
import 'package:covid19_traker_bloc/components/component/counter_detail.dart';
import 'package:covid19_traker_bloc/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class GlobalDetail extends StatefulWidget {
  const GlobalDetail({Key? key}) : super(key: key);

  @override
  _GlobalDetailState createState() => _GlobalDetailState();
}

class _GlobalDetailState extends State<GlobalDetail> {
  late CoronaSummaryBloc coronaSummaryBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coronaSummaryBloc = BlocProvider.of<CoronaSummaryBloc>(context);
    coronaSummaryBloc.add(fetchCoronaSummary());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0,
          title:Text("Số liệu trên toàn thế giới".toUpperCase(),style: TextStyle(color: Colors.teal),) ,
          centerTitle: true,
          systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.tealAccent),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BlocBuilder<CoronaSummaryBloc, CoronaSummaryState>(
              builder: (context, state) {
                if(state is CoronaSummaryLoading) {
                  return Center(child:  CircularProgressIndicator());
                }
                if(state is CoronaSummaryLoadingFailure) {
                  return Center(
                    child: Text('Cannot load comments from Server', style: TextStyle(fontSize: 22, color: Colors.red),),
                  );
                }
                if(state is CoronaSummaryLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 50.0, bottom: 10,top: 20),
                        child: Container(
                          child: Text('Thế giới', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.red)),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CounterDetail(
                            number: state.summary.newConfirmed,
                            color: kInfectedColor,
                            title: "Số ca mắc mới",
                          ),
                          CounterDetail(
                            number: state.summary.totalConfirmed,
                            color: kInfectedColor,
                            title: "Tổng số ca mắc",
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CounterDetail(
                            number: state.summary.newRecovered,
                            color: kRecovercolor,
                            title: "Số ca hồi phục mới",
                          ),
                          CounterDetail(
                            number: state.summary.totalRecovered,
                            color: kRecovercolor,
                            title: "Tổng số ca hồi phục",
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CounterDetail(
                            number: state.summary.newDeaths,
                            color: kDeathColor,
                            title: "Số ca tử vong mới",
                          ),
                          CounterDetail(
                            number: state.summary.totalDeaths,
                            color: kDeathColor,
                            title: "Tổng số ca tử vong",
                          )
                        ],
                      )
                    ],
                  );
                }
                return Center(child: Text('Other states..'));//never run this line, only fix warning.
              },
            ),
          ],
        ),
      )
    );
  }
}
