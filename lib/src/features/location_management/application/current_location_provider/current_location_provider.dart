import 'package:geocoding/geocoding.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/features/shopping/application/delivery_address_provider/delivery_address_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'current_location_provider.g.dart';

@Riverpod()
class CurrentLocation extends _$CurrentLocation {
  @override
  Future<Address?> build() async {
    final position = await _getCurrentLocation();
    return getAddressFromPosition(position);
  }

  void setCurrentLocationAddress(Address address) {
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

  Future<Position> _getCurrentLocation() async {
    await _handleLocationPermission();
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<Address?> getAddressFromPosition(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        ref.read(deliveryAddressProvider.notifier).setDeliveryAddress(Address(
              street: placemark.thoroughfare.toString(),
              number: placemark.subThoroughfare.toString(),
              neighborhood: placemark.subLocality.toString(),
              city: placemark.locality.toString(),
              state: placemark.administrativeArea.toString(),
              zipCode: placemark.postalCode.toString(),
            ));
        return Address(
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
      throw Exception('Error fetching address from location');
    }
  }
}
