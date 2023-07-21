import 'package:bloc_skeleton/common_ui/common_typography.dart';
import 'package:bloc_skeleton/common_ui/widgets/common_loading.dart';
import 'package:bloc_skeleton/core/utils/colors_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonCircleImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final String userName;
  final bool isCounter;

  const CommonCircleImage(
      {Key? key,
      required this.imageUrl,
      this.size = 48,
      this.userName = '',
      this.isCounter = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty && userName.isNotEmpty) {
      return generateUsernamePicture();
    } else if (imageUrl.isEmpty) {
      return CircleAvatar(
        radius: size * 4 / 5,
        backgroundImage: const AssetImage(
          'assets/png/img_no_image.png',
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (_, __) => CommonLoading(
        height: size,
        width: size,
      ),
      errorWidget: (_, __, ___) {
        return _buildErrorWidget();
      },
      imageBuilder: (_, provider) {
        return CircleAvatar(
          radius: size * 4 / 5,
          backgroundImage: provider,
        );
      },
    );
  }

  Widget _buildErrorWidget() {
    if (userName.isNotEmpty) {
      return generateUsernamePicture();
    } else {
      return CircleAvatar(
        radius: size * 4 / 5,
        backgroundImage: const AssetImage(
          'assets/png/img_no_image.png',
        ),
      );
    }
  }

  Widget generateUsernamePicture() {
    List<String> nameParts = userName.split(' ');
    String initials = '';
    if (isCounter) {
      initials = userName;
    } else {
      for (int i = 0; i < nameParts.length && i < 2; i++) {
        initials += nameParts[i].substring(0, 1).toUpperCase();
      }
    }
    return Container(
      decoration: BoxDecoration(
        color: ColorsUtil.getRandomColorFromString(userName),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: size * 4 / 5,
        child: Text(
          initials,
          style: isCounter
              ? CommonTypography.textInter11.copyWith(color: Colors.white)
              : CommonTypography.textInter11.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
