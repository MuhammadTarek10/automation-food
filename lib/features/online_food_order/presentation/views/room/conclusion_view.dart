import 'dart:developer';

import 'package:auto_food/features/online_food_order/domain/entities/conclusion.dart';
import 'package:auto_food/features/online_food_order/presentation/widgets/conclusion_card.dart';
import 'package:flutter/material.dart';

class ConclusionView extends StatefulWidget {
  const ConclusionView({
    Key? key,
    required this.conclusion,
  }) : super(key: key);

  final OnlineConclusion conclusion;

  @override
  State<ConclusionView> createState() => _ConclusionViewState();
}

class _ConclusionViewState extends State<ConclusionView> {
  @override
  Widget build(BuildContext context) {
    log(widget.conclusion.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conclusion'),
      ),
      body: SingleChildScrollView(
        child: ConclusionCard(
          conclusion: widget.conclusion,
        ),
      ),
    );
  }
}
