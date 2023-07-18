import 'package:clean_architecture_tdd_course/features/card_management/presentation/pages/dashboard_page.dart';
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
    return Column(children: [
      Text(cardStackType[cardIndex].creditCardData.name),
      Text(cardStackType[cardIndex].creditCardData.email),
      Text(cardStackType[cardIndex].creditCardData.phoneNumber),
      Text(cardStackType[cardIndex].creditCardData.ibanNumber),
    ]);
  }
}
