import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/location.dart';
import '../../widgets/image_banner.dart';
import 'tile_overlay.dart';

class Locations extends StatelessWidget {
  final locations = Location.fetchAll();

  _onLocationTap(BuildContext context, int locationID) {
    // print('${locations.elementAt(locationID)} was tapped');
    print('${locations.elementAt(locationID - 1).name} was tapped');
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {"id": locationID});
  }

  Widget _itemBuilder(BuildContext context, Location location) {
    return GestureDetector(
      onTap: () => _onLocationTap(context, location.id),
      child: Container(
        height: 245.0,
        child: Stack(
          children: [
            ImageBanner(assetPath: location.imagePath, height: 245.0),
            TileOverlay(location),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) =>
            _itemBuilder(context, locations[index]),
      ),
    );
  }
}
