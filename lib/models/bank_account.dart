import 'package:flutter_ui_study/enums/currency.dart';

class BankAccount {
  final Currency currency;
  final int balance;

  BankAccount({
    required this.currency,
    required this.balance,
  });

  String getBalanceString() {
    final List<int> numbers = [];
    int currentBalance = balance;

    while (currentBalance > 0) {
      numbers.insert(0, currentBalance % 1000);
      currentBalance ~/= 1000;
    }

    return numbers.join(" ");
  }
}
