
import 'package:covid19_traker_bloc/components/country_detail.dart';
import 'package:covid19_traker_bloc/components/global_detail.dart';
import 'package:covid19_traker_bloc/constants.dart';
import 'package:covid19_traker_bloc/pages/home_page.dart';
import 'package:covid19_traker_bloc/pages/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin{
  TabController? controller;
  int _selectedIndex =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: IndexedStack(
            children: <Widget>[
              InfiniteList(),
              GlobalDetail(),
              CountryDetail(),
              InforPage(),
            ],
            index: _selectedIndex,
          ),
          bottomNavigationBar: Material(
            child: TabBar(
              labelColor:  kPrimaryColor,
              unselectedLabelColor: Colors.lightGreen,
              tabs:<Widget> [
                Tab(icon: Icon(MdiIcons.virus,size:25),),
                Tab(icon: Icon(MaterialCommunityIcons.earth, size: 25)),
                Tab(icon: Icon(Ionicons.md_flag, size: 25)),
                Tab(icon: Icon(Entypo.newsletter, size: 25)),
              ],
              onTap: (index){
                setState(() {
                  _selectedIndex=index;
                });
              },
            ),
          ),
        )
    );
  }
}
