// ignore_for_file: sort_child_properties_last

import 'dart:async';
import 'package:PinkCity/bloc/autocomplete/autocomplete_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../bloc/location/location_bloc.dart';
import '../const/colors.dart';


class ChangeAddressScreen extends StatefulWidget {
  // static const routeName = "/changeAddressScreen";

  const ChangeAddressScreen({super.key});

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}
bool show=false;
class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
      final Completer<GoogleMapController> _controller =Completer();
      // LatLng? _latlng;
       
    // ignore: non_constant_identifier_names
    // Future<void> GetCurrentLocation() async {
    //   Location location = Location();
    //   bool serviceEnabled;
    //   PermissionStatus permissionGranted;
    //   LocationData locationData;
      
    //   serviceEnabled = await location.serviceEnabled();
    //   if (!serviceEnabled) {
    //     serviceEnabled = await location.requestService();
    //     if (!serviceEnabled) {
    //       return;
    //     }
    //   }

    //   permissionGranted = await location.hasPermission();
    //   if (permissionGranted == PermissionStatus.denied) {
    //     permissionGranted = await location.requestPermission();
    //     if (permissionGranted != PermissionStatus.granted) {
    //       return;
    //     }
    //   }

    //   locationData = await location.getLocation();
    //   _latlng=LatLng(locationData.latitude!,locationData.longitude!);

    //   _kGooglePlex=CameraPosition(target: _latlng!,
    //   zoom:14,
    //   );
    //   setState(() {});

    //   }



  // static final Marker _kGooglePlexMarker =Marker(
  //   markerId: const MarkerId("_KGooglePlex"),
  //   infoWindow: const InfoWindow(title: 'Google Plex'),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: const LatLng(37.43296265331129, -122.08832357078792),
  // );

    // @override
    // initState(){
    //   super.initState();
    //   GetCurrentLocation();
    // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(backgroundColor: const Color.fromARGB(213, 255, 255, 255),
          title: const Text("Change Address",style: TextStyle(color: AppColor.darkPink,fontWeight: FontWeight.w900),),),
          body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LocationLoaded) {
            return Stack(
            children: [
              Expanded(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition:CameraPosition(
                    target: LatLng(
                      state.place.lat,
                      state.place.lon,
                    ),
                    zoom: 18,),
                  onMapCreated: (GoogleMapController controller) {
                    context.read<LocationBloc>().add(
                          LoadMap(controller: controller),
                        );
                  },
                  // markers: {_kGooglePlexMarker},
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  indoorViewEnabled: true,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    const LocationInput(),
                   BlocBuilder<AutocompleteBloc, AutocompleteState>(
                  builder: (context, state) {
        if (state is AutocompleteLoading) {
          return const SizedBox();
        }
        if (state is AutocompleteLoaded) {
          return SizedBox(
            height: 300,
            width: 300,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: state.autocomplete.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white.withOpacity(0.8),
                  child: ListTile(
                    title: Text(
                      state.autocomplete[index].description,
                      style: TextStyle(color: Colors.grey.shade600,fontSize: 20,fontStyle: FontStyle.italic)
                    ),
                    leading: const Icon(Icons.pin_drop_sharp,),
                    onTap: () {
                      context.read<LocationBloc>().add(
                            SearchLocation(
                              placeId: state.autocomplete[index].placeId,
                            ),
                          );
                      context.read<AutocompleteBloc>().add(ClearAutocomplete());

                    },
                  ),
                );
              },
            ),
          );
        } else {
          return const Text('Something went wrong!');
        }
      },
    ),
                  ],
                ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child : InkWell(
                    enableFeedback: true,
                                  
                    onTap: (){
                      show =!show;
                      setState(() {
                        
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          width: !show ?40 :150,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: AppColor.darkPink,
                             boxShadow: const [
                            BoxShadow(
                            color: Color.fromARGB(92, 99, 98, 98),
                            offset: Offset(2.0, 2.0),
                            blurRadius: 1.0,),],),
                            padding: const EdgeInsets.all(7),
                            child: !show? const CircleAvatar(child: Icon(Icons.pin_drop_rounded,color: Colors.white,),backgroundColor: AppColor.darkPink,)
                               :const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              // Icon(Icons.pin_drop_rounded,color: Colors.white),
                              Text("Save location",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                            ],),
                        ),
                    ),
                    ),
                  ),
              
            ],
          );
    }
    return Container();
    }
    ),
         
    );
  }
}
// Rest of the code remains the same.
class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class LocationInput extends StatelessWidget {
  const LocationInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteBloc,AutocompleteState>(
      builder: (context, state) {
        if(state is AutocompleteLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        if (state is AutocompleteLoaded){
          return  Padding(
          padding: const EdgeInsets.symmetric(vertical:18.0,horizontal: 7),
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
       boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(92, 216, 193, 193),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                icon: const Icon(Icons.search),
                hintText: 'Enter Your Location',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white)
                  ),
              ),
              onChanged: (Value){
                context.read<AutocompleteBloc>().add(LoadAutocomplete(searchInput: Value));
              },
            ),
          ),
      );    

        }
        else {return const Text("something went wrong");}
      },
       
    );
  }
}





