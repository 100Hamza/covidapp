import 'package:flutter/material.dart';

import 'layout/countries_details_body.dart';

class CountriesDetailsView extends StatelessWidget {
  String countryName, flagimage;
  int totalCases, totalDetails, totalRecovered, active, critical, text;


  CountriesDetailsView({required this.countryName, required this.flagimage, required this.totalCases,
      required this.totalDetails, required this.totalRecovered, required this.active, required this.critical,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(countryName),
      ),
      body: CountryDetailBody(flagimage: flagimage, active: active, critical: critical, text: text, totalCases: totalCases, totalDetails: totalDetails, totalRecovered: totalRecovered),
    );
  }
}
