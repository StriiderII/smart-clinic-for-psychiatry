import 'package:flutter/material.dart';

class ChatBotTextFormField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool isReadOnly;
  final void Function(String)? onFieldSubmitted;

  const ChatBotTextFormField(
      {super.key,
      this.focusNode,
      this.controller,
      required this.isReadOnly,
      required this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      autocorrect: false,
      focusNode: focusNode,
      controller: controller,
      readOnly: isReadOnly,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        hintText: 'Enter your prompt...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Please enter some prompt';
        }
        return null;
      },
    );
  }
}
