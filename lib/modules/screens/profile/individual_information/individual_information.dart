import 'package:flutter/material.dart';

class IndividualInformationScreen extends StatefulWidget {
  const IndividualInformationScreen({
    super.key,
    required this.title,
  });

  final String title;
  @override
  State<IndividualInformationScreen> createState() =>
      _IndividualInformationScreenState();
}

class _IndividualInformationScreenState
    extends State<IndividualInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
