/*
import 'package:profile/model/location.dart';
import 'package:flutter/material.dart';

class Locui extends StatefulWidget {
  const Locui({Key? key}) : super(key: key);

  @override
  State<Locui> createState() => _LocuiState();
}

class _LocuiState extends State<Locui> {

  String? lat, long, country, adminArea;

  @override
  void initState() {
    super.initState();
    getLocation();
  }


  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text('location latitude ${lat ?? 'loading" '}'),
        Text('location  longitude${long ?? 'loading" '}'),
        Text('location  longitude${country ?? 'loading" '}'),
        Text('location  longitude${adminArea ?? 'loading" '}'),
      ],
    ));
  }

  void getLocation() async {
    final service = LocationServer();
    final locationData = await service.getLocation();

    if (locationData != null) {
      final placemark = await service.getPlaceMark(locationData: locationData);

      setState(() {
        lat = locationData.latitude!.toStringAsFixed(2);
        long = locationData.longitude!.toStringAsFixed(2);

        country = placemark?.country ?? 'cound not get country';
        adminArea = placemark?.administrativeArea ?? 'cound not get adminArea';
      });
    }
  }

}
*/