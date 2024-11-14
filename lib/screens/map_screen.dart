import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  // Coordenadas de Santa Cruz y La Paz
  static const LatLng santaCruz = LatLng(-17.7833, -63.1833);
  static const LatLng laPaz = LatLng(-16.5000, -68.1500);

  final Set<Marker> markers = {
    const Marker(
      markerId: MarkerId('santa_cruz'),
      position: santaCruz,
      //title: 'Santa Cruz',
    ),
    const Marker(
      markerId: MarkerId('la_paz'),
      position: laPaz,
      //title: 'La Paz',
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _launchMapsUrl() async {
  final Uri url = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&origin=${santaCruz.latitude},${santaCruz.longitude}&destination=${laPaz.latitude},${laPaz.longitude}');
  
  if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication, // Para abrir en un navegador externo
    );
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Ruta'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: santaCruz,
              zoom: 4,
            ),
            markers: markers,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              //onPressed:(){},
              onPressed: _launchMapsUrl,
              child: const Text('Navegar'),
            ),
          ),
        ],
      ),
    );
  }
}



// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapSample extends StatefulWidget {
//   const MapSample({super.key});

//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: const Text('To the lake!'),
//         icon: const Icon(Icons.directions_boat),
//       ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }