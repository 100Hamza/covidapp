import 'package:covidapp/presentation/Services/states_services.dart';
import 'package:covidapp/presentation/elements/custom_button.dart';
import 'package:covidapp/presentation/models/WorldStatesModel.dart';
import 'package:covidapp/presentation/view/countires_list/countires_list_view.dart';
import 'package:covidapp/presentation/view/world_screen/widget/custom_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldScreenBody extends StatefulWidget {
  const WorldScreenBody({super.key});

  @override
  State<WorldScreenBody> createState() => _WorldScreenBodyState();
}

class _WorldScreenBodyState extends State<WorldScreenBody> with TickerProviderStateMixin{
  final colorList = <Color>[
    const Color(0XFF4285F4),
    const Color(0XFF1aa260),
    const Color(0XFFde5246),
  ];

  late final AnimationController _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          FutureBuilder(
            future: statesServices.fetchWorldStatesRecord(),
            builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
              if (!snapshot.hasData) {
                return Expanded(
                  flex: 1,
                  child: SpinKitSpinningLines(
                    controller: _animationController,
                    color: Colors.white,
                    size: 50.0,
                  ),
                );
              } else {
                return Column(
                  children: [
                    PieChart(
                      dataMap: {'Total': double.parse(snapshot.data!.cases.toString()), 'Recovered': double.parse(snapshot.data!.recovered.toString()), 'Deaths': double.parse(snapshot.data!.deaths.toString())},
                      animationDuration: const Duration(milliseconds: 1200),
                      colorList: colorList,
                      chartRadius: MediaQuery.sizeOf(context).width / 3.2,
                      chartType: ChartType.ring,
                      legendOptions: const LegendOptions(
                        legendPosition: LegendPosition.left,
                      ),
                      ringStrokeWidth: MediaQuery.sizeOf(context).width * 0.04,
                      chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.sizeOf(context).height * 0.06),
                      child: Card(
                        child: Column(
                          children: [
                            CustomDataWidget(
                              title: 'Total Cases',
                              value: snapshot.data!.cases.toString(),
                            ),
                            CustomDataWidget(
                              title: 'Recovered',
                              value: snapshot.data!.recovered.toString(),
                            ),
                            CustomDataWidget(
                              title: 'Deaths',
                              value: snapshot.data!.deaths.toString(),
                            ),
                            CustomDataWidget(
                              title: 'Deaths',
                              value: snapshot.data!.deaths.toString(),
                            ), CustomDataWidget(
                              title: 'Critical',
                              value: snapshot.data!.critical.toString(),
                            ), CustomDataWidget(
                              title: 'Tests',
                              value: snapshot.data!.tests.toString(),
                            ),CustomDataWidget(
                              title: 'Population',
                              value: snapshot.data!.population.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(buttonTitle: 'Track Countries' , onPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CountriesListView(),));
                    }),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
