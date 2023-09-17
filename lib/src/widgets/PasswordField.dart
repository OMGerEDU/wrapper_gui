// An example when you are using StatefulWidget
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PasswordField extends StatefulWidget {
  final String initialValue;
  final String id;
  final String label;

  const PasswordField({required this.initialValue, required this.id, required this.label});

  @override
  _PasswordField createState() => _PasswordField();
}

class _PasswordField extends State<PasswordField> {
  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    // .. your code here
    return FormBuilderTextField(
      name: widget.id,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          suffixIcon: IconButton(
            icon: Icon(_hideText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _hideText = !_hideText; // Switches between true/false when button is pressed
              });
            },
          )
      ),
      obscureText: _hideText,
    );
  }
}