import 'package:flutter/material.dart';

class ConclusionView extends StatefulWidget {
  const ConclusionView({Key? key}) : super(key: key);

  @override
  State<ConclusionView> createState() => _ConclusionViewState();
}

class _ConclusionViewState extends State<ConclusionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ASD"),
      ),
    );
  }
}
