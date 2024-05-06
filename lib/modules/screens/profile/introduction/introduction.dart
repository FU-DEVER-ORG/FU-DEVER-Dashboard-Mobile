import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  late final QuillController _controller;

  @override
  void initState() {
    super.initState();
    _controller = QuillController(
      document: Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Expanded(
        child: QuillEditor.basic(
          configurations: QuillEditorConfigurations(
            controller: _controller,
            // readOnly: false,
            sharedConfigurations: const QuillSharedConfigurations(
              locale: Locale('de'),
            ),
          ),
        ),
      ),
    );
  }
}
