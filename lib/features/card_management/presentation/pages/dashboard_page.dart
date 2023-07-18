import 'package:Enter/features/card_management/domain/entities/credit_card.dart';
import 'package:Enter/features/card_management/domain/entities/user_data.dart';
import 'package:Enter/features/card_management/presentation/widgets/card_page_widgets/card_info.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// TODO: Fix quickly written dirty code, UI and some minor issues (no time)

class Dashboard extends StatefulWidget {
  final UserData userData;
  Dashboard({required this.userData});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<CreditCard> userDataCreditCardsListCopy;
  late List<CardData> fixedLengthStackCards;
  late List<CardData> dynamicLengthStackCards;
  late int tracker;

  @override
  void initState() {
    super.initState();
    userDataCreditCardsListCopy = widget.userData.cards;
    fixedLengthStackCards = [];
    dynamicLengthStackCards = [];
    if (userDataCreditCardsListCopy.length >= 3) tracker = 3;

    for (var i = 0; i < userDataCreditCardsListCopy.length && i < 3; i++) {
      fixedLengthStackCards.add(
        CardData(
          color: Colors.green,
          creditCardData: userDataCreditCardsListCopy[i],
        ),
      );
    }
  }

  void _handleCardTap(CardData card) {
    setState(() {
      if (card.tapToggle) {
        // If the card that was tapped is tapped again, bring it back to its previous position
        card.tapToggle = false;

        // Remove the added card at the first of the stack
        fixedLengthStackCards.add(dynamicLengthStackCards.last);
        if (fixedLengthStackCards.length >= 4) {
          tracker--;
          fixedLengthStackCards.removeAt(0);
        }
        dynamicLengthStackCards.removeLast();
      } else {
        // If the card was tapped, animate it to the bottom and add a new card to the stack
        card.tapToggle = true;

        if (fixedLengthStackCards.isNotEmpty) {
          dynamicLengthStackCards.add(fixedLengthStackCards.removeLast());
        }

        // Check if there are more cards in the userDataCreditCardsListCopy
        if (tracker < userDataCreditCardsListCopy.length) {
          fixedLengthStackCards.insert(
            0,
            CardData(
              color: Colors.green,
              creditCardData: userDataCreditCardsListCopy[tracker],
            ),
          );
          tracker++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          fixedLengthStack(),
          SizedBox(
            height: 2.h,
          ),
          dynamicLengthStack(),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton.extended(
          label: Text('new'),
          onPressed: () {},
        ),
      ),
    );
  }

  Expanded dynamicLengthStack() {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (int i = 0; i < dynamicLengthStackCards.length; i++)
            Positioned(
              top: 35.h,
              child: GestureDetector(
                onTap: () => _handleCardTap(dynamicLengthStackCards[i]),
                child: Card(
                  elevation: 8,
                  color: dynamicLengthStackCards[i].color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/card_background.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: dynamicLengthStackCards[i].tapToggle ? 220 : 180,
                    height: 300,
                    child: Stack(
                      children: [
                        CardInfo(
                            cardStackType: dynamicLengthStackCards,
                            cardIndex: i),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Image.asset('assets/images/visa_mark.png'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Expanded fixedLengthStack() {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (int i = 0; i < fixedLengthStackCards.length; i++)
            Positioned(
              top: fixedLengthStackCards[i].tapToggle
                  ? 260.0 + i * 30.0
                  : 30.0 + i * 20.0,
              child: GestureDetector(
                onTap: () => _handleCardTap(fixedLengthStackCards[i]),
                child: Card(
                  elevation: 8,
                  color: fixedLengthStackCards[i].color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/card_background.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width:
                            220 - (fixedLengthStackCards.length - i - 1) * 20.0,
                        height: 50.h,
                        child: CardInfo(
                            cardStackType: fixedLengthStackCards, cardIndex: i),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset('assets/images/visa_mark.png'))
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CardData {
  final Color color;
  bool tapToggle;
  CreditCard creditCardData;

  CardData(
      {required this.color,
      this.tapToggle = false,
      required this.creditCardData});
}
