import 'package:flutter/material.dart';
import '../../widgets/location_tile.dart';
import '../../widgets/image_banner.dart';
import 'text_section.dart';
import '../../models/location.dart';

class LocationDetail extends StatelessWidget {
  final int _locationID;
  LocationDetail(this._locationID);

  @override
  Widget build(BuildContext context) {
    // NOTE: we'll be moving this to a scoped_model later
    final location = Location.fetchByID(_locationID);

    return Scaffold(
        appBar: AppBar(
          title: Text(location.name),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ImageBanner(assetPath: location.imagePath, height: 200),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
                  child: LocationTile(location: location),
                ),
              ]..addAll(textSections(location))),
        ));
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(
              fact.title,
              fact.text,
            ))
        .toList();
  }
}
