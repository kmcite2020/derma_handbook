import 'package:uuid/uuid.dart' show Uuid;

const appTitle = 'RX - Skin';
// ignore: prefer_const_constructors
String get randomID => Uuid().v1();
