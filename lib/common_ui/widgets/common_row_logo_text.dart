import 'package:bloc_skeleton/common_ui/colors.dart';
import 'package:bloc_skeleton/common_ui/common_icons.dart';
import 'package:bloc_skeleton/common_ui/common_typography.dart';
import 'package:bloc_skeleton/core/utils/empty_padding.dart';
import 'package:flutter/material.dart';

class RowLogoText extends StatelessWidget {
  const RowLogoText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonIcons.logoHse,
        6.pw,
        Text(
          text,
          style: CommonTypography.textH5.copyWith(color: AppColors.madhaniBlue),
        ),
      ],
    );
  }
}
