import 'dart:convert';
import 'package:covidapp/presentation/models/WorldStatesModel.dart';
import 'package:http/http.dart' as http;
import 'Utilities/app_urls.dart';

class StatesServices {

  Future<WorldStatesModel> fetchWorldStatesRecord () async  {

    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode == 200)
      {
        var data = jsonDecode(response.body);

        return WorldStatesModel.fromJson(data);

      }

    else
      {
        throw Exception('Error');
      }

  }


  Future<List<dynamic>> countriesList ( ) async
  {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if(response.statusCode == 200)
      {
        data = jsonDecode(response.body);
        return data;
      }

    else
      {
        throw Exception('Error');
      }
  }


}