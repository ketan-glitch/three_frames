import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.type, this.title, required this.onTap, this.child});

  final ButtonType type;
  final String? title;
  final Widget? child;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: MaterialButton(
        height: 56,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(type == ButtonType.primary ? 16 : 8),
          side: type == ButtonType.primary
              ? BorderSide.none
              : const BorderSide(
                  color: Color(0XFFDDE2EB),
                ),
        ),
        color: type == ButtonType.primary ? const Color(0XFF111827) : null,
        onPressed: onTap,
        disabledColor: type == ButtonType.primary ? Colors.grey : null,
        child: child ??
            Text(
              title!,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: type == ButtonType.primary
                        ? Colors.white
                        : onTap == null
                            ? const Color(0XFF69788C)
                            : const Color(0XFF0D1D33),
                  ),
            ),
      ),
    );
  }
}

enum ButtonType {
  primary,
  secondary;
}
