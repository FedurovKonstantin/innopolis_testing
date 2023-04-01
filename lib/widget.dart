import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyWidget(title: 'Title', message: 'Message'),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            isVisible = !isVisible;
          }),
        ),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Text(
                  widget.message,
                  key: const Key('message'),
                ),
              ),
              if (isVisible)
                const Text(
                  'visible',
                  key: Key('visible'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
