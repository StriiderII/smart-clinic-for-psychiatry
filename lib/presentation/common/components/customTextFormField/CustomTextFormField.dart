import 'package:flutter/material.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';


typedef Validator = String? Function(String?);

class CustomFormField extends StatefulWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool secureText;
  final Validator? validator;
  final TextEditingController? controller;
  final int lines;

  CustomFormField({
    Key? key,
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.secureText = false,
    this.validator,
    this.controller,
    this.lines = 1,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: widget.validator,
            obscureText: widget.secureText && _obscureText,
            minLines: widget.lines,
            maxLines: widget.lines,
            keyboardType: widget.keyboardType,
            style: TextStyle(color: MyTheme.selectedIconBlueColor),
            cursorColor: MyTheme.selectedIconBlueColor,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: MyTheme.selectedIconBlueColor,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: Colors.transparent,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyTheme.whiteColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyTheme.whiteColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyTheme.whiteColor),
              ),
              suffixIcon: widget.secureText
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
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
