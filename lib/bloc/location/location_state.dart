part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final Place place;
  final GoogleMapController? controller;

  LocationLoaded({
    required this.place,
    this.controller,

  });

  @override
  List<Object?> get props => [controller, place,];
}