import 'package:flutter/material.dart';

class OnlineHomeView extends StatefulWidget {
  const OnlineHomeView({Key? key}) : super(key: key);

  @override
  State<OnlineHomeView> createState() => _OnlineHomeViewState();
}

class _OnlineHomeViewState extends State<OnlineHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ASD")),
    );
  }
}
