import 'package:equatable/equatable.dart';

class CreditCard extends Equatable {
  final String name;
  final String phoneNumber;
  final String email;
  final String ibanNumber;

  CreditCard(
      {required this.name,
      required this.phoneNumber,
      required this.email,
      required this.ibanNumber});

  @override
  List<Object?> get props => [name, phoneNumber, email, ibanNumber];
}
