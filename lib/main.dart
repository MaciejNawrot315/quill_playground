import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Quill Demo',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late QuillController _controller;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _controller = QuillController(
        document: Document(),
        selection: const TextSelection.collapsed(offset: 0));
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10)),
          width: 500,
          height: 500,
          child: Column(
            children: [
              QuillEditor(
                  controller: _controller,
                  focusNode: _focusNode,
                  scrollController: ScrollController(),
                  scrollable: true,
                  padding: const EdgeInsets.all(20),
                  autoFocus: false,
                  readOnly: false,
                  expands: false),
              QuillToolbar.basic(
                controller: _controller,
                color: Colors.transparent,
                toolbarIconAlignment: WrapAlignment.start,
                toolbarIconCrossAlignment: WrapCrossAlignment.end,
                iconTheme: const QuillIconTheme(
                  iconUnselectedColor: Colors.blue,
                  iconUnselectedFillColor: Colors.transparent,
                  iconSelectedColor: Colors.green,
                  iconSelectedFillColor: Colors.transparent,
                ),
                multiRowsDisplay: false,
                showDividers: false,
                showFontFamily: false,
                showFontSize: false,
                showStrikeThrough: false,
                showInlineCode: false,
                showBackgroundColorButton: false,
                showClearFormat: false,
                showLeftAlignment: false,
                showCenterAlignment: false,
                showRightAlignment: false,
                showJustifyAlignment: false,
                showListNumbers: false,
                showListBullets: false,
                showListCheck: false,
                showCodeBlock: false,
                showQuote: false,
                showIndent: false,
                showUndo: false,
                showRedo: false,
                showSearchButton: false,
                showSubscript: false,
                showSuperscript: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
