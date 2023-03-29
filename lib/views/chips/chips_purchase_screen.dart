import 'package:flutter/material.dart';
import 'package:mobile/widgets/custom_appbar.dart';

class ChipsPurchaseScreen extends StatefulWidget {
  const ChipsPurchaseScreen({super.key});

  @override
  State<ChipsPurchaseScreen> createState() => _ChipsPurchaseScreenState();
}

class _ChipsPurchaseScreenState extends State<ChipsPurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Purchase Detais"),
    );
  }
}
