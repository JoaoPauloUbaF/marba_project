import 'package:flutter/material.dart';

class RegistrationUtils {
  static final RegistrationUtils _instance = RegistrationUtils._internal();

  factory RegistrationUtils() {
    return _instance;
  }

  RegistrationUtils._internal();

  List<DropdownMenuItem<String>> getStatesList() {
    return <String>[
      // 'AC',
      // 'AL',
      // 'AP',
      // 'AM',
      // 'BA',
      // 'CE',
      // 'DF',
      // 'ES',
      // 'GO',
      // 'MA',
      // 'MT',
      // 'MS',
      'MG',
      // 'PA',
      // 'PB',
      // 'PR',
      // 'PE',
      // 'PI',
      // 'RJ',
      // 'RN',
      // 'RS',
      // 'RO',
      // 'RR',
      // 'SC',
      'SP',
      // 'SE',
      // 'TO'
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getCitiesList() {
    return <String>[
      'Lavras',
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  double currencyStringToDouble(String currencyString) {
    currencyString = currencyString.replaceAll('R\$ ', '');
    currencyString = currencyString.replaceAll('.', '');
    currencyString = currencyString.replaceAll(',', '.');
    return double.parse(currencyString);
  }

  String doubleAsCurrency(double number) {
    var parts = number.toStringAsFixed(2).split('.');
    parts[0] = parts[0].replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );
    return 'R\$ ${parts[0]},${parts[1]}';
  }

  String stringToCamelCase(String text) {
    final result = text
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
    return result;
  }
}
