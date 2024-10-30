import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:hugeicons/hugeicons.dart';

class InputField extends StatefulWidget {
  final String field;
  final String? initialValue;
  final bool disabled;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final bool? autoValidate;
  final FormFieldValidator<String>? validator;

  const InputField({
    super.key,
    required this.field,
    this.initialValue,
    this.disabled = false,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.autoValidate = false,
    this.validator,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
  }

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      enabled: !widget.disabled,
      obscureText: widget.isPassword ? _isObscured : false,
      style: const TextStyle(
        fontSize: 16,
        color: AppColors.primaryDark,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primaryLight.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primaryGreen,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryGreen.withOpacity(0.5),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: const TextStyle(
          color: AppColors.primaryGreen,
          fontWeight: FontWeight.bold,
        ),
        labelText: widget.field,
        hintText: widget.hintText,
        labelStyle: const TextStyle(
          color: AppColors.primaryGreen,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscured
                      ? HugeIcons.strokeRoundedViewOffSlash
                      : HugeIcons.strokeRoundedView,
                  color: AppColors.primaryDark,
                ),
                onPressed: _toggleObscureText,
              )
            : widget.suffixIcon != null
                ? Icon(widget.suffixIcon)
                : null,
      ),
      autovalidateMode: widget.autoValidate == true
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      validator: widget.validator,
    );
  }
}
