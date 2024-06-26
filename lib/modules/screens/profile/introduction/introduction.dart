import 'package:flutter/material.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:fudever_dashboard/modules/screens/profile/profile_screen.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:html/parser.dart' show parse;

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key, required this.title, required this.data}) : super(key: key);
  final String title;
  final dynamic data;

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final _editorFocusNode = FocusNode();
  late QuillController? _controller = null;
  bool _verificationSuccess = false;

  late List<Map<String, dynamic>> delta;

  void handleSubmit()async{
    if(_controller!.document.toDelta().toJson().isNotEmpty){
      final converter = QuillDeltaToHtmlConverter(
        _controller!.document.toDelta().toJson(),
        ConverterOptions.forEmail(),
      );

      final html = converter.convert();

      Map<String, dynamic> updatedFavourites = {
        "description" : html,
      };
      dynamic response = await UserController.editUsers(options: updatedFavourites);
      if(response['status'] == 'success'){
        Navigator.of(context).pop(true);
      }
    }
  }
  @override
  void initState() {
    if(widget.data==null){
    _controller = QuillController(
    document: Document.fromJson([{'insert':'Write about your self \n'}]),
    selection: TextSelection.collapsed(offset: 0)
    );
    }else if(widget.data.contains("<")) {
      var document = parse(widget.data);
      Delta delta = Delta()..insert(document.body!.text + '\n');
      _controller = QuillController(
          document: Document.fromJson(delta.toJson()),
          selection: TextSelection.collapsed(offset: 0)
      );
    }else {
      _controller = QuillController(
        document: Document.fromJson([{'insert':'${widget.data!}\n'}]),
        selection: TextSelection.collapsed(offset: 0)
      );
    };

    _controller!.addListener(() {
      delta = _controller!.document.toDelta().toJson();

    });
    super.initState();
  }
  @override
  void dispose() {
    _editorFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _editorFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 247, 250),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  border: Border.all(
                    color: const Color.fromARGB(255, 225, 225, 226),
                  ),
                ),
                child: QuillToolbar.simple(
                  configurations: QuillSimpleToolbarConfigurations(
                    showClipboardPaste: false,
                    showBackgroundColorButton: false,
                    showClipboardCopy: false,
                    showClipboardCut: false,
                    showAlignmentButtons: true,
                    showSuperscript: false,
                    showSearchButton: false,
                    toolbarSectionSpacing: -2,
                    sectionDividerSpace: 0,
                    showFontFamily: false,
                    showQuote: false,
                    showDirection: false,
                    showHeaderStyle: false,
                    showListBullets: false,
                    showLink: false,
                    showListNumbers: false,
                    showSubscript: false,
                    showCodeBlock: false,
                    showListCheck: false,
                    showFontSize: false,
                    showInlineCode: false,
                    controller: _controller!,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  border: Border.all(
                    color: const Color.fromARGB(255, 225, 225, 226),
                  ),
                ),
                height: 275,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: QuillEditor.basic(
                    focusNode: _editorFocusNode,
                    configurations: QuillEditorConfigurations(
                      controller: _controller!,
                      checkBoxReadOnly: false,
                      sharedConfigurations: const QuillSharedConfigurations(
                        locale: Locale('en'),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 89,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3.0,
                blurRadius: 5.0,
                offset: const Offset(2.0, 4.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
            child: ElevatedButton(
              onPressed: handleSubmit,
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: const Size(160, 20),
              ),
              child: const Text(
                'Xác nhận',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        // child: Column(
        //   children: [
        //     const QuillToolbar(),
        //     Expanded(
        //       child: QuillEditor.basic(
        //         configurations: const QuillEditorConfigurations(
        //           readOnly: false,
        //         ),
        //       ),
        //     )
        //   ],
        // ),
      )
    );
  }

  void _showVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          // backgroundColor: Color.fromARGB(255, 243, 5, 5),
          elevation: 0,
          child: _verificationSuccess
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/verified_successfully.svg',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Xác nhận thành công!',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        );
      },
    );
    // Timer(const Duration(seconds: 3), () {
    //   setState(() {
    //     _verificationSuccess = true;
    //   });
    // });
  }
}
