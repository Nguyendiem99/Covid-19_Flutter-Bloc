import 'package:covid19_traker_bloc/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CounterDetail extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  const CounterDetail({
    Key? key,required this.number,required this.color,required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: kShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFF5F5F7),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  offset: Offset(20, 20),
                  blurRadius: 20,
                  color: Colors.indigoAccent.withOpacity(0.50)
              ),
            ]
        ),
        width: 180,
        height: 100,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "${title}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "${number}".replaceAllMapped(reg, mathFunc),
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: color,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
