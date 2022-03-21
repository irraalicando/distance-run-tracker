import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;
  final IconData? suffixIcon;
  final Function? suffixIconFunction;
  final bool? decimalOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autoFocus,
        textInputAction: inputAction,
        obscureText: isObscure,
        maxLength: 100,
        keyboardType: inputType,
        inputFormatters: decimalOnly == true
            ? [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                TextInputFormatter.withFunction((oldValue, newValue) {
                  try {
                    final text = newValue.text;
                    if (text.isNotEmpty) double.parse(text);
                    return newValue;
                  } catch (e) {}
                  return oldValue;
                }),
              ]
            : null,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: suffixIcon == null
                ? null
                : IconButton(
                    icon: Icon(suffixIcon, color: Colors.grey),
                    onPressed: () {
                      if (suffixIconFunction != null) {
                        suffixIconFunction!();
                      }
                    }),
            hintText: hint,
            errorText: errorText,
            counterText: '',
            icon: icon == null
                ? null
                : isIcon
                    ? Icon(icon, color: iconColor)
                    : null),
      ),
    );
  }

  const TextFieldWidget({
    Key? key,
    this.icon,
    required this.errorText,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
    this.suffixIcon,
    this.suffixIconFunction,
    this.decimalOnly,
  }) : super(key: key);
}
