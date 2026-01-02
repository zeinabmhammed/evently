import 'package:evently/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);
class CustomFormField extends StatefulWidget {
  String label;
  IconData prefixIcon;
  TextInputType keyboardType;
  bool isPassword;
  Validator? validator;
  TextEditingController? controller;

  CustomFormField({
    required this.label,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator,
    this.controller,
    super.key,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool secureText = true ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextFormField(
            controller: widget.controller ,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword && secureText,
            cursorColor: Theme.of(context).colorScheme.primary,
            style: TextStyle(
              color: AppColors.lightPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              labelText: widget.label,
              prefixIcon: Icon(widget.prefixIcon,
                color: Theme.of(context).iconTheme.color,
              ),
              suffixIcon: widget.isPassword==true ?
              InkWell(
                onTap: () {
                  setState(() {
                    secureText = !secureText;
                  });
                },
                child: Icon(
                  secureText ?
                  Icons.visibility_off_rounded :
                  Icons.visibility_rounded,
                  color: AppColors.grey,
                ),
              ):null,
            ),
          ),
        ),
      ],
    );
  }
}
