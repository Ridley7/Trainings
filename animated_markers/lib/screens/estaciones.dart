import 'package:animated_markers/data/MapMarker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const MAPBOX_ACCESS_TOKEN = 'pk.eyJ1IjoiZ29uemFsZXpmcmFua3MiLCJhIjoiY2t1d281bWE5MGJneDMzbGE3ZWljaDE4ZSJ9.-3JQ4KI7H0XnNFRtx1jmhw';
const MAPBOX_STYLE = 'mapbox.mapbox-streets-v8';
const MARKER_COLOR = Color(0xFF3DC5A7);
const MARKER_SIZE_EXPANDED = 55.0;
const MARKER_SIZE_SHRINKED = 38.0;

final _myLocation = LatLng(-12.0362176, -77.0296812);

class Estaciones extends StatefulWidget {

  @override
  _EstacionesState createState() => _EstacionesState();
}

class _EstacionesState extends State<Estaciones> {

  final _pageController = PageController();
  int _selectedIndex = 0;

  List<Marker> _buildMarkers(){
    final _markerList = <Marker>[];
    for(int i = 0; i < mapMarkers.length; i++){
      final mapItem = mapMarkers[i];
      _markerList.add(
        Marker(
          height: MARKER_SIZE_EXPANDED,
            width: MARKER_SIZE_EXPANDED,
            point: mapItem.location,
            builder: (_) {
              return GestureDetector(
                onTap: (){
                  _selectedIndex = i;
                  setState(() {
                    _pageController.animateToPage(i, duration: const Duration(milliseconds: 500), curve: Curves.elasticOut);
                    print('Selected: ${mapItem.title}');
                  });
                },
                child: _LocationMarker(
                  selected: _selectedIndex == i,
                )
              );
            },
        )
      );
    }

    return _markerList;
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildMarkers();
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Markers'),
        actions: [
          IconButton(
              onPressed: () => null,
              icon: Icon(Icons.filter_alt_outlined
              ))
        ],
      ),

      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
            minZoom: 5,
            maxZoom: 18,
            zoom: 13,
            center: _myLocation
          ),
            nonRotatedLayers: [
              TileLayerOptions(
                urlTemplate: 'https://api.mapbox.com/styles/v1/gonzalezfranks/ckuxt2i2tqzpt17o4a5623kk6/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZ29uemFsZXpmcmFua3MiLCJhIjoiY2t1d281bWE5MGJneDMzbGE3ZWljaDE4ZSJ9.-3JQ4KI7H0XnNFRtx1jmhw',
                additionalOptions: {
                  'accessToken': MAPBOX_ACCESS_TOKEN,
                  'id': MAPBOX_STYLE
                }
              ),

              MarkerLayerOptions(
                markers: _markers
              ),

              MarkerLayerOptions(
                markers: [
                  Marker(
                      point: _myLocation,
                      builder: (_) {
                        return _MyLocationMarker();
                      }
                  )
                ]
              )
            ],
          ),

          //Add a pageview
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.35,
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mapMarkers.length,
                itemBuilder: (context, index){
                  final item = mapMarkers[index];
                  return _MapItemDetails(
                      mapMarker: item,
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}

class _LocationMarker extends StatelessWidget {

  final bool selected;

  const _LocationMarker({Key? key, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = selected ? MARKER_SIZE_EXPANDED : MARKER_SIZE_SHRINKED;
    return Center(
      child: AnimatedContainer(
        height: size,
        width: size,
        duration: const Duration(milliseconds: 400),
        child: Image.asset('assets/animated_markers/marker.png'),
      ),
    );
  }
}


class _MyLocationMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: MARKER_COLOR,
        shape: BoxShape.circle
      ),
    );
  }
}

class _MapItemDetails extends StatelessWidget {

  final MapMarker mapMarker;

  const _MapItemDetails({Key? key, required this.mapMarker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _styleTitle = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
    final _styleAddress = TextStyle(color: Colors.grey[800], fontSize: 14);
    return Padding(
        padding: const EdgeInsets.all(15.0),
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text("Estación: Muelle de España"),

                Spacer(),

                GestureDetector(
                  onTap: (){},
                  child: new Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(1),

                      child: Icon(
                        Icons.info_outline,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: 8.0,
                ),

                GestureDetector(
                  onTap: (){},
                  child: new Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(1),
                      child: Icon(
                          Icons.receipt_outlined,
                          color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Text("Latitud:"),
            Text("Longitud:"),
            Text("Velocidad de viento:"),
            Text("Dirección de viento:"),
            Text("Temperatura ambiente:"),
            Text("Humedad relativa:"),
            Text("Presión barometrica:"),

            Expanded(
              child: Container(
                child: PageView.builder(
                  itemCount: itemsAire.length,
                    itemBuilder: (context, index){
                    final item = itemsAire[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                      child: Stack(
                        children: [
                          //background container
                          Positioned(
                            top: 30.0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(color: Colors.grey, width: 1.0),
                              ),

                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "SO2",
                                  style: TextStyle(fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.w600),),

                                  SizedBox(width: 10,),

                                  Text(
                                    item,
                                    style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600),),

                                  Spacer(),

                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CustomPaint(
                                      painter: CirclePainter(),
                                    ),
                                  )
/*
                                  Spacer(),



                                  RichText(text: TextSpan(
                                    children: [
                                      TextSpan(text: "#", style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600)),
                                      TextSpan(text: "6.00", style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600))
                                    ]
                                  ))
                                  */
                                ],
                              ),

                            ),
                          )
                        ],
                      ),
                    );
                    }
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 2
  // Use [PaintingStyle.fill] if you want the circle to be filled.
    //..style = PaintingStyle.stroke;
  ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

