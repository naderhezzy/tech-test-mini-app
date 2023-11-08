import 'package:f1_ranking/styles/app_styles.dart';
import 'package:f1_ranking/utils/utils.dart';
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
          padding: const EdgeInsets.only(
            left: AppStyles.spacingExtraSmall,
            bottom: AppStyles.spacingSmall,
          ),
          child: Text(
            labelText,
            style: const TextStyle(
              fontSize: AppStyles.fontSizeExtraSmall,
              color: AppStyles.lightTextColor,
            ),
          ),
        ),
        SizedBox(
          height: setHeight(55),
          child: TextFormField(
            controller: controller,
            validator: (value) => validator(value),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: AppStyles.fontSizeExtraSmall,
                color: AppStyles.ultraLightTextColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppStyles.radiusSmall),
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
