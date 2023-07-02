import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardModel {
  String doctor;
  int cardBackground;
  dynamic cardIcon;

  CardModel(this.doctor, this.cardBackground, this.cardIcon);
}

List<CardModel> cards = [
  CardModel("Cardiologist", 0xFFec407a, FontAwesomeIcons.heart),
  CardModel("Dentist", 0xFF5c6bc0, FontAwesomeIcons.tooth),
  CardModel("Eye Special", 0xFFfbc02d, FontAwesomeIcons.eye),
  CardModel("Orthopaedic", 0xFF1565C0, FontAwesomeIcons.wheelchair),
  CardModel("Paediatrician", 0xFF2E7D32, FontAwesomeIcons.baby),
];
