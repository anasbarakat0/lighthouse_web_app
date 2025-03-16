import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lighthouse_web_app/core/resources/colors.dart';

class MyTextFieldDialog extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final bool isPassword;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const MyTextFieldDialog({
    super.key,
    this.controller,
    required this.labelText,
    required this.isPassword,
    this.readOnly,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<MyTextFieldDialog> createState() => _MyTextFieldDialogState();
}

class _MyTextFieldDialogState extends State<MyTextFieldDialog> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: widget.controller,
        inputFormatters: widget.inputFormatters,
        obscureText: _obscureText,
        readOnly: widget.readOnly ?? false,
        onTap: widget.onTap,
        onSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: Theme.of(context).textTheme.labelSmall,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: darkNavy, width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          fillColor: Colors.grey[200],
          filled: true,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
        autofocus: true,
      ),
    );
  }
}
