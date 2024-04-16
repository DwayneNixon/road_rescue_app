import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login.dart';

// ignore: use_key_in_widget_constructors

class MapPage extends StatelessWidget {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            icon: Icon(Icons.perm_identity_sharp),
          )
        ],
        backgroundColor: const Color(0xFF9BC1BC),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(19.0814, 72.8891),
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
}
