import 'package:flutter/material.dart';
import './style.dart';

import 'views/locations/Locations.dart';
import 'views/location_detail/location_detail.dart';

const LocationsRoute = '/';
const LocationDetailRoute = '/location_detail';

class App extends StatelessWidget {
  // This widget is the root of your application.

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LocationsRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          screen = LocationDetail(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(title: AppBarTextStyle),
      ),
      textTheme: TextTheme(
        title: TitleTextStyle,
        subtitle: SubTitleTextStyle,
        caption: CaptionTextStyle,
        body1: Body1TextStyle,
      ),
      primarySwatch: Colors.blue,
      fontFamily: 'Kanit',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'บทเรียนฟลัตเตอร์',
      onGenerateRoute: _routes(),
      theme: _theme(),
      home: Locations(),
    );
  }
}
