import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String hint;
  final String label;
  final IconData? icon;

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final void Function(String value) onChanged;

  const TextInputWidget({
    Key? key,
    required this.hint,
    required this.label,
    required this.onChanged,
    this.icon,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixIcon: icon != null ? Icon(icon) : null,
          hintText: hint,
          labelText: label,
          contentPadding: const EdgeInsets.all(0),
          hintStyle: TextStyle(color: Colors.grey[350]),
        ),
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
