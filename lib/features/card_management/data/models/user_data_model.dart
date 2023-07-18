import 'package:equatable/equatable.dart';

class UserDataModel extends Equatable {
  final String token;
  final List<CreditCardModel> cards;

  UserDataModel({required this.token, required this.cards});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> cardList = json['cards'] ?? [];
    final cards =
        cardList.map((cardJson) => CreditCardModel.fromJson(cardJson)).toList();

    return UserDataModel(
      token: json['token'] ?? '',
      cards: cards,
    );
  }

  Map<String, dynamic> toJson() {
    final List<dynamic> cardJsonList =
        cards.map((card) => card.toJson()).toList();

    return {
      'token': token,
      'cards': cardJsonList,
    };
  }

  @override
  List<Object?> get props => [token, cards];
}

class CreditCardModel extends Equatable {
  final String name;
  final String phoneNumber;
  final String email;
  final String ibanNumber;

  CreditCardModel({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.ibanNumber,
  });

  factory CreditCardModel.fromJson(Map<String, dynamic> json) {
    return CreditCardModel(
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'] ?? '',
      ibanNumber: json['ibanNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'ibanNumber': ibanNumber,
    };
  }

  @override
  List<Object?> get props => [name, phoneNumber, email, ibanNumber];
}
