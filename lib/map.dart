// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatelessWidget {
  final LatLng userLocation = LatLng(19.0814, 72.8891);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Live Map',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showLocationPopup(context);
            },
            icon: Icon(Icons.share_location),
            tooltip: 'Share Location',
          )
        ],
        backgroundColor: const Color(0xFF9BC1BC),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: userLocation,
          initialZoom: 17,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/dwaynenixon/clv11sg31005f01pfebb7h3fb/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZHdheW5lbml4b24iLCJhIjoiY2x2MTB4cGZ4MDFxejJpbWljMmRjNjJsaiJ9.1uqtcqi94k0JfxGSmqzIbA',
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoiZHdheW5lbml4b24iLCJhIjoiY2x2MTB4cGZ4MDFxejJpbWljMmRjNjJsaiJ9.1uqtcqi94k0JfxGSmqzIbA',
              'id': 'mapbox.mapbox-streets-v8',
            },
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () =>
                    launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showLocationPopup(BuildContext context) {
    String mapLink =
        'https://www.google.com/maps/search/?api=1&query=${userLocation.latitude},${userLocation.longitude}';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Share Location'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Latitude: ${userLocation.latitude}'),
              Text('Longitude: ${userLocation.longitude}'),
              SizedBox(height: 10),
              Text('Map Link:'),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(mapLink));
                },
                child: Text(
                  mapLink,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
