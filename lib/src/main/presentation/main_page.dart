import 'package:bloc_skeleton/common_ui/colors.dart';
import 'package:bloc_skeleton/common_ui/common_typography.dart';
import 'package:bloc_skeleton/src/main/presentation/history/history_page.dart';
import 'package:bloc_skeleton/src/main/presentation/home/home_page.dart';
import 'package:bloc_skeleton/src/main/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static const route = '/';

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedPage = 0;

  final pages = const [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(selectedPage),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.gray[200]!,
              blurRadius: 8.0,
              offset: const Offset(0.0, -2.0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          // shadowColor: AppColors.mGrey,
          // elevation: 1.0,
          selectedLabelStyle: CommonTypography.textH9.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.primaryText),
          unselectedLabelStyle: CommonTypography.textH9.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.primaryText),
          currentIndex: selectedPage,
          fixedColor: AppColors.primaryText,
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                activeIcon: Icon(
                  Icons.home,
                  color: AppColors.madhaniBlue,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_sharp),
                label: 'Assessment',
                activeIcon: Icon(
                  Icons.list_alt_sharp,
                  color: AppColors.madhaniBlue,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                activeIcon: Icon(
                  Icons.person,
                  color: AppColors.madhaniBlue,
                )),
          ],
          // labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          // indicatorColor: Colors.transparent,

          // destinations: const [
          //   NavigationDestination(
          //     icon: Icon(Icons.home),
          //     selectedIcon: Icon(
          //       Icons.home,
          //       color: AppColors.madhaniBlue,
          //     ),
          //     label: 'Home',
          //   ),
          //   NavigationDestination(
          //     icon: Icon(Icons.history),

          //     label: 'History',
          //   ),
          //   NavigationDestination(
          //     icon: Icon(Icons.person),
          //     label: 'Profile',
          //   ),
          // ],
          // selectedIndex: selectedPage,
          // onDestinationSelected: (idx) {
          //   setState(() {
          //     selectedPage = idx;
          //   });
          // },
        ),
      ),
    );
  }
}
