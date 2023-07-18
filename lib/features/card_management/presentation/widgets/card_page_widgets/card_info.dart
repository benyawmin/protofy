import 'package:Enter/features/card_management/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
    required this.cardStackType,
    required this.cardIndex,
  });

  final List<CardData> cardStackType;
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    TextStyle cardTextStyle = TextStyle(color: Color(0xFFF5F5F7));
    return Column(children: [
      Text(
        cardStackType[cardIndex].creditCardData.name,
        style: cardTextStyle,
      ),
      Text(
        cardStackType[cardIndex].creditCardData.email,
        style: cardTextStyle,
      ),
      Text(
        cardStackType[cardIndex].creditCardData.phoneNumber,
        style: cardTextStyle,
      ),
      Text(
        cardStackType[cardIndex].creditCardData.ibanNumber,
        style: cardTextStyle,
      ),
    ]);
  }
}
