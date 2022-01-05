import 'package:latlong2/latlong.dart';

class MapMarker{

  final String image;
  final String title;
  final String address;
  final LatLng location;

  const MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.location});
}

final _locations = [
  LatLng(-12.0080041, -77.0778237),
  LatLng(-12.0430962, -77.0208307),
  LatLng(-12.0480045, -77.0205112),
  LatLng(-12.0654067, -77.0257675),
  LatLng(-12.0238438, -77.0822122),
  LatLng(-12.0211287, -77.0502137),
  LatLng(-12.0622444, -77.0708716),
];

const _path = 'assets/animated_markers/';

final mapMarkers = [
  MapMarker(
      image: '${_path}logo_marcos.png',
      title: 'Marcos',
      address: 'Address Marcos 123',
      location: _locations[0]
  ),

  MapMarker(
      image: '${_path}logo_paavo.png',
      title: 'Paavo',
      address: 'Address Pavo 123',
      location: _locations[1]
  ),

  MapMarker(
      image: '${_path}logo_papa_jhons.png',
      title: 'Papa Johns',
      address: 'Address Papa Jhons 123',
      location: _locations[2]
  )
];

final itemsAire = [
  "Hola",
  "Que",
  "Tal"
];