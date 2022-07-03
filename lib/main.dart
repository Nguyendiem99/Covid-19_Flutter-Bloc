import 'dart:developer';
import 'package:covid19_traker_bloc/blocs/corona_country/bloc.dart';
import 'package:covid19_traker_bloc/blocs/corona_country_summary/bloc.dart';
import 'package:covid19_traker_bloc/blocs/corona_summary/bloc.dart';
import 'package:covid19_traker_bloc/blocs/country_detail/bloc.dart';
import 'package:covid19_traker_bloc/pages/tab_bar.dart';
import 'package:covid19_traker_bloc/servers/repository.dart';
import 'package:covid19_traker_bloc/servers/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CoronaRepository coronaRepository = CoronaRepository(covidService: CovidService());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home:MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CoronaCountriesBloc(
                coronaRepository: coronaRepository
            ),
          ),
          BlocProvider(
            create: (context) => CoronaCountriesSummaryBloc(
              coronaRepository: coronaRepository,
            ),
          ),
          BlocProvider(
            create: (context) => CoronaSummaryBloc(
              coronaRepositotry: coronaRepository,
            ),
          ),
          BlocProvider(
            create: (context) => CountryDetailBloc(
              coronaRepository: coronaRepository
            ),
          ),
        ],
        child: TabBarPage(),

      ),

    );
  }
}

