import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:coranavirus/feature/maps/bloc/maps_bloc.dart';
import 'package:coranavirus/feature/maps/bloc/maps_event.dart';
import 'package:coranavirus/feature/maps/bloc/maps_state.dart';
import 'package:coranavirus/feature/maps/country_item_view.dart';
import 'package:coranavirus/model/confirmed_mdl.dart';
import 'package:coranavirus/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsVisual extends StatefulWidget {
  @override
  State<MapsVisual> createState() => MapsVisualState();
}

class MapsVisualState extends State<MapsVisual> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  String _darkMapStyle;
  MapsBloc _bloc = MapsBloc();
  List<ConfirmedMdl> listCase = List();
  List<ConfirmedMdl> listFilterCase = List();
  GoogleMapController _mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  ScrollController _scrollController;

  TextEditingController _textEditingController = TextEditingController();
  BitmapDescriptor _iconMarker;
  String queryRegion = "";

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/maps_style.json').then((string) {
      _darkMapStyle = string;
    });
    _bloc..add(GetListCaseEvent());

    _getMarker();
  }

  _getMarker() async {
    await getBytesFromCanvas(72, Colors.orange[100]).then((val) {
      print("marker done ");
      _iconMarker = BitmapDescriptor.fromBytes(val);
    });
  }

  _addMarker() async {
    final Circle circle = Circle(
      circleId: CircleId("1"),
    );

    for (int i = 0; i < listCase.length; i++) {
      final Marker marker = Marker(
        markerId: MarkerId(i.toString()),
        position: LatLng(double.parse(listCase[i].lat.toString()),
            double.parse(listCase[i].long.toString())),
        icon: _iconMarker,
        onTap: () {},
      );

      markers[MarkerId(i.toString())] = marker;
    }
  }

  _performSearch() {
  listFilterCase  = new List();
    for (int i = 0; i < listCase.length; i++) {
      var item = listCase[i];

      if (item.countryRegion
          .toLowerCase()
          .contains(queryRegion.toLowerCase())) {
        listFilterCase.add(item);
      }
    }
  }

  Widget _listSearchView(){
   return ListView.builder(
      controller: _scrollController,
      itemCount: listFilterCase.length,
      itemBuilder: (BuildContext context, int index) {
        return CountryItemView(
          data: listFilterCase[index],
          onTap: () {
            _goToLocation(
                double.parse(
                    listFilterCase[index]
                        .lat
                        .toString()),
                double.parse(
                    listFilterCase[index]
                        .long
                        .toString()));
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            if (state is OnSuccessGetListCaseState) {
              listCase.clear();
              listCase.addAll(state.response);
              _addMarker();
            }
            return Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationButtonEnabled: false,
                    initialCameraPosition:
                        CameraPosition(target: LatLng(-0.7893, 113.9213)),
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                      controller.setMapStyle(_darkMapStyle);
                      _controller.complete(controller);
                    },
                    markers: Set<Marker>.of(markers.values),
                  ),
                ),
                DraggableScrollableSheet(
                    initialChildSize: 0.5,
                    minChildSize: 0.5,
                    maxChildSize: 1.0,
                    builder: (context, scroll) {
                      _scrollController = scroll;
                      return Container(
                        color: Theme.of(context).backgroundColor,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              width: 46,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8)),
                              child: null,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 24),
                              child: TextField(
                                controller: _textEditingController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusColor: Colors.grey,
                                  hintText: "Type city or province region ..",
                                  prefixIcon: Icon(Icons.search),
                                ),
                                onChanged: (va) {
                                  setState(() {
                                    queryRegion = va;
                                    _performSearch();
                                  });
                                },
                              ),
                            ),
                            queryRegion==null ||queryRegion.isEmpty? Expanded(
                              child: ListView.builder(
                                controller: scroll,
                                itemCount: listCase.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CountryItemView(
                                          data: listCase[index],
                                          onTap: () {
                                            _goToLocation(
                                                double.parse(listCase[index]
                                                    .lat
                                                    .toString()),
                                                double.parse(listCase[index]
                                                    .long
                                                    .toString()));
                                          },
                                        );

                                },
                              ),
                            ): Expanded(child: _listSearchView()),
                          ],
                        ),
                      );
                    })
              ],
            );
          }),
    );
  }

  Future<void> _goToLocation(double latitude, double longitude) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(latitude, longitude), zoom: 4.151926040649414)));
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  Future<Uint8List> getBytesFromCanvas(int size, Color color) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = HexColor("#66c6fc03");
    final double radius = size / 2;
    canvas.drawCircle(Offset(radius, radius), radius, paint);
//    canvas.drawRRect(
//        RRect.fromRectAndCorners(
//          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
//          topLeft: radius,
//          topRight: radius,
//          bottomLeft: radius,
//          bottomRight: radius,
//        ),
//        paint);
//    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
//    painter.text = TextSpan(
//      text: 'Hello world',
//      style: TextStyle(fontSize: 25.0, color: Colors.white),
//    );
//    painter.layout();
//    painter.paint(canvas, Offset((width * 0.5) - painter.width * 0.5, (height * 0.5) - painter.height * 0.5));
    final img = await pictureRecorder
        .endRecording()
        .toImage(radius.toInt() * 2, radius.toInt() * 2);
    final data = await img.toByteData(format: ImageByteFormat.png);
    return data.buffer.asUint8List();
  }
}
