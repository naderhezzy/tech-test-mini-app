// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:f1_ranking/config/app_config.dart';
import 'package:f1_ranking/styles/app_styles.dart';
import 'package:f1_ranking/utils/utils.dart';
import 'package:f1_ranking/views/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:f1_ranking/widgets/next_button.dart';
import 'package:f1_ranking/widgets/custom_text_field.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  String? _firstNameValidator(value) {
    if (value!.isEmpty) {
      return 'First name is required';
    }
    if (!RegExp(r'^[a-zA-Z\s]*$').hasMatch(value)) {
      return 'First name should contain only letters and spaces.';
    }

    return null;
  }

  String? _lastNameValidator(value) {
    if (value!.isEmpty) {
      return 'Last name is required';
    }
    if (!RegExp(r'^[a-zA-Z\s]*$').hasMatch(value)) {
      return 'Last name should contain only letters and spaces.';
    }

    return null;
  }

  void _onNextPressed(BuildContext context) {
    // Checks form validation and push
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, __, ___animation2) => HomeScreen(
            firstName: _firstNameController.value.text,
            lastName: _lastNameController.value.text,
          ),
          transitionDuration: const Duration(seconds: 0),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        padding: EdgeInsets.symmetric(
          vertical: setHeight(60),
          horizontal: setWidth(47),
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Column(
                children: [
                  SvgPicture.asset('assets/svg/f1-logo.svg'),
                  SizedBox(height: setHeight(70)),
                  Text(
                    'Let’s Get Familiar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppStyles.headlineTextColor,
                      fontSize: AppStyles.fontSizeExtraLarge,
                      fontWeight: AppStyles.fontWeightBold,
                      height: setHeight(0.03),
                    ),
                  ),
                  SizedBox(height: setHeight(40)),
                  Text(
                    'Introduce Yourself',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppStyles.lightTextColor,
                      fontSize: AppStyles.fontSizeLarge,
                      fontWeight: FontWeight.w400,
                      height: setHeight(0.07),
                    ),
                  )
                ],
              ),
              SizedBox(
                // Reducing spacing between elements when keyboard is open
                height: setHeight(200) - (context.keyboardHeight / 3),
              ),
              Form(
                key: _formKey,
                child: FormField<String>(
                  builder: (state) {
                    return Column(
                      children: [
                        CustomTextField(
                          labelText: 'First name',
                          hintText: 'Type in your first name',
                          validator: _firstNameValidator,
                          controller: _firstNameController,
                        ),
                        SizedBox(height: setHeight(23)),
                        CustomTextField(
                          labelText: 'last name',
                          hintText: 'Type in your last name',
                          validator: _lastNameValidator,
                          controller: _lastNameController,
                        ),
                        SizedBox(
                          // Reducing spacing between elements when keyboard is open
                          height: setHeight(100) - (context.keyboardHeight / 7),
                        ),
                        NextButton(onPressed: () => _onNextPressed(context))
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
