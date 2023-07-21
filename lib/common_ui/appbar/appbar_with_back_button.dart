import 'package:bloc_skeleton/common_ui/common_typography.dart';
import 'package:flutter/material.dart';

class AppBarWithBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  final Color backgroundColor;
  final String textTitle;
  final Color textColor;
  final bool isUnderline;
  final IconData? icon;
  final Color iconColor;
  final Function() onBackClicked;

  const AppBarWithBackButton({
    Key? key,
    this.textTitle = '',
    this.isUnderline = false,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.icon = Icons.arrow_back,
    this.iconColor = Colors.black,
    required this.onBackClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      elevation: isUnderline ? 1 : 0,
      leading: IconButton(
        icon: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onBackClicked,
      ),
      title: Text(
        textTitle,
        style: CommonTypography.textInter17
            .copyWith(color: textColor, fontWeight: FontWeight.w500),
      ),
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
