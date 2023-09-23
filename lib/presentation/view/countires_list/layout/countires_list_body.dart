import 'package:covidapp/presentation/Services/states_services.dart';
import 'package:covidapp/presentation/elements/custom_edittext_field.dart';
import 'package:covidapp/presentation/view/countries_details/countries_details_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountiesListBody extends StatefulWidget {
  const CountiesListBody({super.key});

  @override
  State<CountiesListBody> createState() => _CountiesListBodyState();
}

class _CountiesListBodyState extends State<CountiesListBody> {
  StatesServices countiesList = StatesServices();
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomEditTextField(
              onChanged: (value) {
                setState(() {

                });
              },
              controller: _editingController,
            ),
          ),
          Expanded(
              child: FutureBuilder(
                future: countiesList.countriesList(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20),
                              leading: Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                              title: Container(
                                height: 10,
                                width: 100,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 100,
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100);
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String countryName = snapshot.data![index]['country'];
                        if (_editingController.text.isEmpty) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    CountriesDetailsView(countryName: snapshot
                                        .data![index]['country'],
                                        flagimage: snapshot
                                            .data![index]['countryInfo']['flag'],
                                        totalCases: snapshot
                                            .data![index]['cases'],
                                        totalDetails: snapshot
                                            .data![index]['deaths'],
                                        totalRecovered: snapshot
                                            .data![index]['recovered'],
                                        active: snapshot.data![index]['active'],
                                        critical: snapshot
                                            .data![index]['critical'],
                                        text: snapshot.data![index]['tests']),));
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20),
                              leading: Image(
                                height: MediaQuery
                                    .sizeOf(context)
                                    .height * .06,
                                width: MediaQuery
                                    .sizeOf(context)
                                    .width * 0.16,
                                image: NetworkImage(
                                    snapshot
                                        .data![index]['countryInfo']['flag']),
                                fit: BoxFit.fill,
                              ),
                              title: Text(snapshot.data![index]['country']),
                              subtitle:
                              Text(snapshot.data![index]['updated'].toString()),
                            ),
                          );
                        } else if (countryName
                            .toLowerCase()
                            .contains(_editingController.text.toLowerCase())) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    CountriesDetailsView(countryName: snapshot
                                        .data![index]['country'],
                                        flagimage: snapshot
                                            .data![index]['countryInfo']['flag'],
                                        totalCases: snapshot
                                            .data![index]['cases'],
                                        totalDetails: snapshot
                                            .data![index]['deaths'],
                                        totalRecovered: snapshot
                                            .data![index]['recovered'],
                                        active: snapshot.data![index]['active'],
                                        critical: snapshot
                                            .data![index]['critical'],
                                        text: snapshot.data![index]['tests']),));
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20),
                              leading: Image(
                                height: MediaQuery
                                    .sizeOf(context)
                                    .height * .06,
                                width: MediaQuery
                                    .sizeOf(context)
                                    .width * 0.16,
                                image: NetworkImage(
                                    snapshot.data![index]['countryInfo']['flag']),
                                fit: BoxFit.fill,
                              ),
                              title: Text(snapshot.data![index]['country']),
                              subtitle:
                              Text(snapshot.data![index]['updated'].toString()),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ))
        ],
      ),
    );
  }
}
