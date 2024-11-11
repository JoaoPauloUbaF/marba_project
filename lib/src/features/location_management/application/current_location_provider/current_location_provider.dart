import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'current_location_provider.g.dart';

@Riverpod()
class CurrentLocation extends _$CurrentLocation {
  @override
  Future<AddressModel?> build() async {
    final position = await getCurrentLocationPosition();
    final address = await getAddressFromPosition(position);
    return address;
  }

  Future<AddressModel?> getCurrentLocation() async {
    return await getAddressFromPosition(await getCurrentLocationPosition());
  }

  void setCurrentLocationAddress(AddressModel address) {
    state = AsyncValue.data(address);
  }

  Future<void> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  Future<Position> getCurrentLocationPosition() async {
    await _handleLocationPermission();
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<AddressModel?> getAddressFromPosition(Position position) async {
    if (kIsWeb) {
      return await _getAddressFromCoordinatesWeb(position);
    } else {
      return await _getAddressFromCoordinatesMobile(position);
    }
  }

  Future<AddressModel?> _getAddressFromCoordinatesWeb(Position position) async {
    try {
      double latitude = position.latitude;
      double longitude = position.longitude;

      // Crie uma instância de HttpsCallable para chamar a função Firebase
      final HttpsCallable callable = FirebaseFunctions.instance
          .httpsCallable('getAddressFromCoordinatesCallable');

      // Chame a função com os parâmetros necessários
      final response = await callable.call(<String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
      });

      // Processar a resposta
      if (response.data != null) {
        final data = response.data as Map<String, dynamic>;

        if (data['address_components'] != null) {
          return _parseAddressComponents(data['address_components']);
        }
      }
      throw Exception('Failed to fetch address from coordinates');
    } catch (e) {
      throw Exception('Error fetching address from location: $e');
    }
  }

  Future<AddressModel?> _getAddressFromCoordinatesMobile(
      Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        return AddressModel.create(
          street: placemark.thoroughfare.toString(),
          number: placemark.subThoroughfare.toString(),
          neighborhood: placemark.subLocality.toString(),
          city: placemark.locality.toString(),
          state: placemark.administrativeArea.toString(),
          zipCode: placemark.postalCode.toString(),
        );
      }
      return null;
    } catch (e) {
      throw Exception('Error fetching address from location $e');
    }
  }

  AddressModel _parseAddressComponents(List<dynamic> components) {
    String street = '';
    String number = '';
    String neighborhood = '';
    String city = '';
    String state = '';
    String zipCode = '';

    for (var component in components) {
      var types = component['types'];
      if (types.contains('route')) {
        street = component['long_name'];
      } else if (types.contains('street_number')) {
        number = component['long_name'];
      } else if (types.contains('sublocality') ||
          types.contains('neighborhood')) {
        neighborhood = component['long_name'];
      } else if (types.contains('locality') ||
          types.contains('administrative_area_level_2')) {
        city = component['short_name'];
      } else if (types.contains('administrative_area_level_1')) {
        state = component['short_name'];
      } else if (types.contains('postal_code')) {
        zipCode = component['long_name'];
      }
    }

    return AddressModel.create(
      street: street,
      number: number,
      neighborhood: neighborhood,
      city: city,
      state: state,
      zipCode: zipCode,
    );
  }
}
