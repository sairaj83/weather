import 'package:geocoding/geocoding.dart';
List listLocation = [
  {
    "city": 'Hyderabad',
    "country": 'IN',
    "lat": 17.3850,
    "long": 78.4867,
  },
  {
    "city": 'Chennai',
    "country": 'IN',
    "lat": 13.0827,
    "long": 80.2707,
  },
  {
    "city": 'Mumbai',
    "country": 'IN',
    "lat": 19.0760,
    "long": 72.8777,
  },
  {
    "city": 'New Delhi',
    "country": 'IN',
    "lat": 28.6139,
    "long": 77.2090,
  }
];

const String apiKey_weather = 'fc5562b4303fd57e19ef392f5aa0fd4a';
const String strweatherApiURL =
    'https://api.openweathermap.org/data/2.5/weather?';
List<Placemark> placemarks = [];

