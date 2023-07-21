import 'package:bloc_skeleton/common_ui/common_colors.dart';
import 'package:bloc_skeleton/common_ui/common_icons.dart';
import 'package:bloc_skeleton/common_ui/common_typography.dart';
import 'package:bloc_skeleton/src/main/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final int notificationAmount;
  final double elevation;
  final Function() onOpenNotif;

  const CommonAppBar(
      {Key? key,
      this.backgroundColor = Colors.white,
      this.title = '',
      this.elevation = 0,
      this.notificationAmount = 0,
      required this.onOpenNotif})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      automaticallyImplyLeading: true,
      elevation: elevation,
      leadingWidth: 32,
      // leading: SvgPicture.asset(
      //   CommonIcons.getAssetPath('Madhani QHSE App Logo.svg'),
      //   width: 32,
      //   height: 32,
      // ),
      bottomOpacity: 0.0,
      title: SvgPicture.asset(
        CommonIcons.getAssetPath('Madhani QHSE App Logo.svg'),
        width: 32,
        height: 32,
      ),
      backgroundColor: backgroundColor,
      centerTitle: false,
      actions: [
        _buildNotificationAction(context),
        const SizedBox(
          width: 12,
        ),
        _buildUserAction(context),
        const SizedBox(
          width: 14,
        ),
      ],
    );
  }

  Widget _buildNotificationAction(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onOpenNotifPage(context);
      },
      child: Container(
        alignment: Alignment.center,
        width: 24,
        height: 24,
        child: Stack(
          children: [
            const Icon(
              Icons.notifications_none_outlined,
              color: CommonColors.black90,
              size: 24,
            ),
            if (notificationAmount != 0) _buildCountBubble(),
          ],
        ),
      ),
    );
  }

  Widget _buildCountBubble() {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(top: 1),
      child: Container(
        alignment: Alignment.center,
        width: 14,
        height: 14,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: CommonColors.red26,
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Center(
            child: Text(
              notificationAmount > 9 ? "9+" : notificationAmount.toString(),
              style: CommonTypography.textInter11
                  .copyWith(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserAction(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onOpenProfilePage(context);
      },
      // child: Image.asset(
      //   "assets/images/profile_icon.png",
      //   width: 24,
      //   height: 24,
      // ),
      child: const Icon(Icons.person),
    );
  }

  void _onOpenProfilePage(BuildContext context) {
    Navigator.of(context).pushNamed(
      ProfilePage.route,
    );
  }

  void _onOpenNotifPage(BuildContext context) {
    onOpenNotif.call();

    /*  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings =
    InitializationSettings(android: androidSettings);
    flutterLocalNotificationsPlugin.show(
      1232211,
      "tes 123221",
      "Lorem Ipsum adala",
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "channel.id212",
          "channel.name221",
          playSound: true,
          channelDescription: "channel.description1",
            priority: Priority.high,
            importance: Importance.max,
          styleInformation: BigTextStyleInformation(''),
        ),
      ),
    );
    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {},
    );*/
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
