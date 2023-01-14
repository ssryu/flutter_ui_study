import 'package:flutter/material.dart';
import 'package:flutter_ui_study/enums/currency.dart';
import 'package:flutter_ui_study/models/bank_account.dart';
import 'package:flutter_ui_study/widgets/button.dart';
import 'package:flutter_ui_study/widgets/currency_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<BankAccount> bankAccounts = [
    BankAccount(currency: Currency.euro, balance: 6428),
    BankAccount(currency: Currency.dollar, balance: 55622),
    BankAccount(currency: Currency.rupee, balance: 28981),
    BankAccount(currency: Currency.bitcoin, balance: 9785),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Hey, Selena",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "\$5 194 482",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Button(
                      text: "Transfer",
                      textColor: Colors.black,
                      backgroundColor: Color(0xFFF1B33B),
                    ),
                    Button(
                      text: "Request",
                      textColor: Colors.white,
                      backgroundColor: Color(0xFF1F2123),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ..._getCurrencyCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getCurrencyCards() {
    final List<Widget> currencyCards = [];
    bool isInverted = false;

    for (int i = 0; i < bankAccounts.length; i++) {
      currencyCards.add(CurrencyCard(
        name: bankAccounts[i].currency.name,
        code: bankAccounts[i].currency.code,
        amount: bankAccounts[i].getBalanceString(),
        icon: bankAccounts[i].currency.icon,
        isInverted: isInverted,
        order: i,
      ));
      isInverted = !isInverted;
    }
    return currencyCards;
  }
}
