import 'package:covid19_traker_bloc/constants.dart';
import 'package:covid19_traker_bloc/models/data_infor.dart';
import 'package:flutter/material.dart';


class InfoItemImages extends StatelessWidget {
  final String title;
  final List<ListDataInfor> listDataInfors;

  InfoItemImages({required this.title, required this.listDataInfors});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.lightGreen.withOpacity(0.23),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(10, 10),
            ),
          ],
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 12),
              child: Text(title,
                  style: TextStyle(
                    fontSize: 16,
                    color: kTitleTextColor,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: listDataInfors.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.23),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(10, 10),
                          ),
                        ],
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(
                            listDataInfors[index].img,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              listDataInfors[index].description,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}