import 'package:clean_architecture_tdd_course/features/card_management/domain/entities/credit_card.dart';
import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String token;
  final List<CreditCard> cards;

  UserData({required this.token, required this.cards});

  @override
  List<Object?> get props => [token, cards];
}
