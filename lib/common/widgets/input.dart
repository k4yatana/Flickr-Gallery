import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final ValueChanged<String> onSubmitted;
  final ValueChanged<String> onBackTap;
  final String hintText;
  final bool autofocus;
  final String text;

  Input({
    @required this.onSubmitted,
    @required this.onBackTap,
    @required this.hintText,
    this.autofocus = false,
    String text,
  }) : text = text ?? '';

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController controller;
  final inputBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(16.0),
    ),
    borderSide: BorderSide(width: 0),
  );
  bool clearIcon;

  @override
  void initState() {
    clearIcon = widget.text.isNotEmpty;
    controller = TextEditingController(text: widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 31.0,
      child: Stack(
        children: <Widget>[
          TextField(
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              height: 1.14,
            ),
            autofocus: widget.autofocus,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 38.0),
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: inputBorder,
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hintText,
            ),
            onChanged: (text) {
              if (text.isEmpty && clearIcon) {
                setState(() {
                  clearIcon = false;
                });
              }
              if (text.isNotEmpty && !clearIcon) {
                setState(() {
                  clearIcon = true;
                });
              }
            },
            onSubmitted: widget.onSubmitted,
          ),
          Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 6.0,
            child: GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              onTap: () => widget.onBackTap(controller.text),
            ),
          ),
          Visibility(
            visible: clearIcon,
            child: Positioned(
              top: 0.0,
              bottom: 0.0,
              right: 9.0,
              child: GestureDetector(
                child: Icon(
                  Icons.clear,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
                onTap: () {
                  controller.clear();
                  setState(() {
                    clearIcon = false;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
