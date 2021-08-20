import 'package:http/http.dart' as http;
import 'package:weather/Utilities/Constants.dart';

class GetCalls {
  Future<http.Response> getLocationWeather(
    double? lat,
    double? long,
  ) async {
    http.Response response = await http.get(Uri.parse(strweatherApiURL +
        'lat=$lat&lon=$long&units=Metric&appid=$apiKey_weather'));
    return response;
  }
}
