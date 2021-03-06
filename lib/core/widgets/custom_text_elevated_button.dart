import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.width = double.infinity,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (3850 / 69).h,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(S.colors.primary),
        ),
        child: Center(
          child: Text(
            text,
            style: S.textStyles.h4,
          ),
        ),
      ),
    );
  }
}
