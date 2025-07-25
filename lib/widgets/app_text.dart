import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/sizes/text_sizes.dart';

class AppText extends StatelessWidget {
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLine;
  final String? text;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final BuildContext? context;

  const AppText({
    super.key,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
    this.fontStyle = FontStyle.normal,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.color,
    this.maxLine,
    this.context,
    this.decoration,
    this.text,
    this.decorationStyle,
  });

  @override
  Widget build(BuildContext context) {
    //Color? defaultColor = Theme.of(context).colorScheme.inversePrimary;

    return Text(
      textAlign: textAlign,
      text ?? '',
      maxLines: maxLine,
      style: TextStyle(
          fontSize: fontSize ?? context.mediumText * 0.9,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          color: color ,
          overflow: overflow ?? TextOverflow.ellipsis,
          fontStyle: fontStyle,
          decoration: decoration,
          decorationStyle: decorationStyle),
    );
  }
}
