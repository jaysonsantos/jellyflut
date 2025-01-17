import 'package:flutter/material.dart';

class OutlineTextField extends StatefulWidget {
  OutlineTextField(this.text,
      {this.controller,
      this.icon,
      this.obscureText = false,
      this.textInputAction,
      this.onSubmitted,
      this.autofocus = false,
      this.focusNode,
      this.borderRadius = 30,
      this.colorUnfocus = const Color(0xFF333333),
      this.colorFocus = const Color(0xFF825191),
      this.prefixIcon});

  final String text;
  final Icon? prefixIcon;
  final bool obscureText;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final double borderRadius;
  final Color colorUnfocus;
  final Color colorFocus;
  final IconData? icon;

  @override
  State<StatefulWidget> createState() => _OutlineTextFieldState();
}

class _OutlineTextFieldState extends State<OutlineTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
          obscureText: widget.obscureText,
          textInputAction: widget.textInputAction,
          controller: widget.controller,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
          onSubmitted: widget.onSubmitted,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: widget.colorUnfocus)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.borderRadius)),
                  borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: widget.colorFocus)),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[600]),
              hintText: widget.text,
              fillColor: Colors.white)),
    );
  }
}
