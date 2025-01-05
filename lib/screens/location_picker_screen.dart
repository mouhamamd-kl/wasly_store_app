// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:wasly_template/core/styles/custom_color_styles.dart';
// import 'package:wasly_template/core/styles/custom_responsive_text_styles.dart';
// import 'package:wasly_template/helpers/app_constants.dart';

// class LocationPickerScreen extends StatefulWidget {
//   @override
//   _LocationPickerScreenState createState() => _LocationPickerScreenState();
// }

// class _LocationPickerScreenState extends State<LocationPickerScreen> {
//   GoogleMapController? mapController;

//   // Custom map style - this matches the minimal design shown
//   final String _mapStyle = '''
//   [
//     {
//       "featureType": "all",
//       "elementType": "geometry",
//       "stylers": [
//         {
//           "color": "#f5f5f5"
//         }
//       ]
//     },
//     {
//       "featureType": "water",
//       "elementType": "geometry",
//       "stylers": [
//         {
//           "color": "#c9e9ff"
//         }
//       ]
//     },
//     {
//       "featureType": "poi.park",
//       "elementType": "geometry",
//       "stylers": [
//         {
//           "color": "#d5ebc3"
//         }
//       ]
//     },
//     {
//       "featureType": "road",
//       "elementType": "geometry",
//       "stylers": [
//         {
//           "color": "#ffffff"
//         }
//       ]
//     },
//     {
//       "featureType": "road",
//       "elementType": "geometry.stroke",
//       "stylers": [
//         {
//           "color": "#e6e6e6"
//         }
//       ]
//     }
//   ]
//   ''';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Map
//           GoogleMap(
//             onMapCreated: (GoogleMapController controller) {
//               mapController = controller;
//               controller.setMapStyle(_mapStyle);
//             },
//             initialCameraPosition: CameraPosition(
//               target: LatLng(37.7749, -122.4194),
//               zoom: 15,
//             ),
//             myLocationButtonEnabled: false,
//             zoomControlsEnabled: false,
//             markers: {
//               Marker(
//                 markerId: MarkerId('selected_location'),
//                 position: LatLng(37.7749, -122.4194),
//               ),
//             },
//           ),

//           // Location tooltip
//           Positioned(
//             top: MediaQuery.of(context).size.height * 0.4,
//             left: MediaQuery.of(context).size.width * 0.5 - 100,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 color: AppColors.primaryDarker,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 'Move to edit location',
//                 style: CustomResponsiveTextStyles.paragraph5
//                     .copyWith(color: AppColors.backgroundAccent),
//               ),
//             ),
//           ),

//           // Bottom search bar and button
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               color: Colors.white,
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Search bar
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: Colors.grey.shade300),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search your location',
//                         hintStyle: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                         ),
//                         border: InputBorder.none,
//                         icon: Icon(Icons.search, color: Colors.grey),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   // Select Location button
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Select Location',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF6C63FF),
//                       minimumSize: Size(double.infinity, 56),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wasly_template/core/styles/custom_color_styles.dart';
import 'package:wasly_template/core/styles/custom_responsive_text_styles.dart';
import 'package:wasly_template/helpers/app_constants.dart';
import 'package:wasly_template/wasly_template.dart';

class LocationPickerScreen extends StatefulWidget {
  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  GoogleMapController? mapController;
  LatLng? _currentPosition;
  bool _isLoading = true;

  // Custom map style - this matches the minimal design shown
  final String _mapStyle = '''
  [
    {
      "featureType": "all",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#f5f5f5"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#c9e9ff"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#d5ebc3"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#ffffff"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry.stroke",
      "stylers": [
        {
          "color": "#e6e6e6"
        }
      ]
    }
  ]
  ''';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
    } catch (e) {
      print("Error getting location: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                // Map
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                    controller.setMapStyle(_mapStyle);
                  },
                  initialCameraPosition: CameraPosition(
                    target: _currentPosition ?? LatLng(37.7749, -122.4194),
                    zoom: 15,
                  ),
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  markers: {
                    Marker(
                      markerId: MarkerId('selected_location'),
                      position: _currentPosition ?? LatLng(37.7749, -122.4194),
                    ),
                  },
                ),

                // Location tooltip
                // Positioned(
                //   top: MediaQuery.of(context).size.height * 0.4,
                //   left: MediaQuery.of(context).size.width * 0.5 - 100,
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //     decoration: BoxDecoration(
                //       color: AppColors.primaryDarker,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: Text(
                //       'Move to edit location',
                //       style: CustomResponsiveTextStyles.paragraph5
                //           .copyWith(color: AppColors.backgroundAccent),
                //     ),
                //   ),
                // ),

                // Bottom search bar and button
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    // color: Colors.white,
                    // padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Search bar
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search your location',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                              icon: Icon(Icons.search, color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        // Select Location button
                        SizedBox(
                          width: double.infinity,
                          child: CustomTextButtonActive(
                            text: "Select Location",
                            onClick: () {},
                            radius: 0,
                            // padding: EdgeInsets.all(0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
