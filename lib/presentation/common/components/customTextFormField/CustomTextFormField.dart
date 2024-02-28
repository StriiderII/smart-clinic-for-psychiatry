import 'package:flutter/material.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';

typedef Validator = String? Function(String?);

class CustomFormField extends StatefulWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool secureText;
  final TextEditingController? controller;
  final int lines;

  const CustomFormField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.secureText = false,
    this.controller,
    this.lines = 1,
    required String? Function(dynamic text) validator,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one symbol';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: widget.secureText ? _passwordValidator : null,
            obscureText: widget.secureText && _obscureText,
            minLines: widget.lines,
            maxLines: widget.lines,
            keyboardType: widget.keyboardType,
            style: TextStyle(color: MyTheme.whiteColor), // Keep text color same
            cursorColor: MyTheme.whiteColor, // Keep cursor color same
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                color:  MyTheme.whiteColor, // Keep hint color same
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: Colors.transparent,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: MyTheme.whiteColor), // Keep border color same
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: MyTheme.whiteColor), // Keep border color same
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: MyTheme.whiteColor), // Keep border color same
              ),
              suffixIcon: widget.secureText
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey, // Keep icon color same
                      ),
                      onPressed: _togglePasswordVisibility,
                    )
                  : null,
            ),
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
