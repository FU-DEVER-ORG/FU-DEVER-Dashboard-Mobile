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
      backgroundColor: const Color.fromARGB(255, 200, 86, 77),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: QuillProvider(
        configurations: QuillConfigurations(
          controller: _controller,
          sharedConfigurations: const QuillSharedConfigurations(
            locale: Locale('en'),
          ),
        ),
        child: Column(
          children: [
            const QuillToolbar(),
            Expanded(
              child: QuillEditor.basic(
                configurations: const QuillEditorConfigurations(
                  readOnly: false,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
