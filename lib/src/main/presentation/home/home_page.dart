import 'package:bloc_skeleton/common_ui/appbar/common_appbar.dart';
import 'package:bloc_skeleton/common_ui/colors.dart';
import 'package:bloc_skeleton/common_ui/common_typography.dart';
import 'package:bloc_skeleton/common_ui/images/common_circle_image.dart';
import 'package:bloc_skeleton/common_ui/styles/radius.dart';
import 'package:bloc_skeleton/common_ui/styles/shadow.dart';
import 'package:bloc_skeleton/core/utils/empty_padding.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CommonAppBar(onOpenNotif: () {}),
      body: Column(
        children: [
          42.ph,
          Container(
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 22),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: AppShadow.xs,
                borderRadius: AppRadius.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CommonCircleImage(
                      imageUrl: '',
                      size: 70,
                    ),
                    6.pw,
                    Column(
                      children: [
                        Text(
                          'Zulkifli Mubarok',
                          style: CommonTypography.textBody.copyWith(
                              color: AppColors.madhaniBlue,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
