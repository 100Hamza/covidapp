import 'package:flutter/material.dart';

import '../../world_screen/widget/custom_data_widget.dart';

class CountryDetailBody extends StatefulWidget {

  String  flagimage;
  int totalCases, totalDetails, totalRecovered, active, critical, text;


  CountryDetailBody({ required this.flagimage, required this.totalCases,
    required this.totalDetails, required this.totalRecovered, required this.active, required this.critical,
    required this.text});


  @override
  State<CountryDetailBody> createState() => _CountryDetailBodyState();
}

class _CountryDetailBodyState extends State<CountryDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.067),
                child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height:  MediaQuery.sizeOf(context).height * 0.067,
                    ),
                    CustomDataWidget(
                      title: 'Total Cases',
                      value: widget.totalCases.toString(),
                    ),CustomDataWidget(
                      title: 'Total Deaths',
                      value: widget.totalDetails.toString(),
                    ),CustomDataWidget(
                      title: 'Total Recovered',
                      value: widget.totalRecovered.toString(),
                    ),CustomDataWidget(
                      title: 'Active',
                      value: widget.active.toString(),
                    ),CustomDataWidget(
                      title: 'Critical',
                      value: widget.critical.toString(),
                    ),CustomDataWidget(
                      title: 'Tests',
                      value: widget.text.toString(),
                    ),
                  ],
                ),
            ),
              ),
              CircleAvatar(
                 backgroundImage: NetworkImage(widget.flagimage),
                radius: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
