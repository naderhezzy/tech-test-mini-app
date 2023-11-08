import 'package:f1_ranking/app/styles/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.controller,
  });

  final String labelText;
  final String hintText;
  final Function validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6, bottom: 8),
          child: Text(
            labelText,
            style: const TextStyle(
              fontSize: 15,
              color: AppStyles.lightTextColor,
            ),
          ),
        ),
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: controller,
            validator: (value) => validator(value),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 15,
                color: AppStyles.ultraLightTextColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppStyles.greenColor,
                ),
                gapPadding: 0,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppStyles.ultraLightTextColor,
                ),
                gapPadding: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
