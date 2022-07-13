import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_reader/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> mapController = Completer();
  MapType mapType = MapType.normal;
  void _onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 18,
    );
    //Marcadores
    Set<Marker> markers = <Marker>{};
    markers.add(
      Marker(
        markerId: const MarkerId('punto-central'),
        position: scan.getLatLng(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
            tooltip: 'Reiniciar posición',
            icon: const Icon(Icons.my_location),
            onPressed: () async {
              final GoogleMapController controller = await mapController.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(puntoInicial),
              );
            },
          )
        ],
      ),
      body: GoogleMap(
        markers: markers,
        myLocationButtonEnabled: true,
        mapType: mapType,
        initialCameraPosition: puntoInicial,
        onMapCreated: _onMapCreated,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Cambiar mapa',
        child: const Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
      ),
    );
  }
}
