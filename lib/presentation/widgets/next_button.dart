import 'package:f1_ranking/app/styles/app_styles.dart';
import 'package:f1_ranking/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: setWidth(209),
        height: setHeight(55),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [AppStyles.darkRedColor, AppStyles.lightRedColor],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyles.radiusSmall),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'NEXT',
              style: TextStyle(
                color: AppStyles.whiteColor,
                fontWeight: AppStyles.fontWeightBold,
              ),
            ),
            SizedBox(width: setWidth(20)),
            SvgPicture.asset('assets/svg/arrow_right.svg'),
          ],
        ),
      ),
    );
  }
}
