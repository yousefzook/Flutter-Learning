import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const kapiKey = '236bf8e8d84f0bdc5c4d2d3157c32fd4';
const kurl = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {

  Future<dynamic> getCityWeather(cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '${kurl}q=$cityName&appid=$kapiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(kurl +
        'lat=${loc.latitude}&lon=${loc.longitude}&appid=$kapiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
