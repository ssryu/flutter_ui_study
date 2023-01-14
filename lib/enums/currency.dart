import 'package:flutter/material.dart';

enum Currency {
  euro(name: "Euro", code: "EUR", icon: Icons.euro_rounded),
  dollar(name: "Dollar", code: "USD", icon: Icons.monetization_on_outlined),
  rupee(name: "Rupee", code: "INR", icon: Icons.currency_rupee_outlined),
  bitcoin(name: "Bitcoin", code: "BTC", icon: Icons.currency_bitcoin);

  const Currency({
    required this.name,
    required this.code,
    required this.icon,
  });

  final String name;
  final String code;
  final IconData icon;
}
