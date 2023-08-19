import 'package:apps/constants.dart';
import 'package:apps/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const Center(child: Text("Screen.2")),
    const Center(child: Text("Screen.3")),
    const Center(child: Text("Screen.4")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: AppColors.whiteColor,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
            debugPrint(value.toString());
          },
          // showSelectedLabels: true,

          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: AppColors.mainColor,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: AppColors.mainColor,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.bookmark,
                  color: AppColors.mainColor,
                ),
                icon: Icon(
                  Icons.bookmark_outline,
                  color: AppColors.mainColor,
                ),
                label: "Bookmark"),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.notifications,
                  color: AppColors.mainColor,
                ),
                icon: Icon(
                  Icons.notifications_outlined,
                  color: AppColors.mainColor,
                ),
                label: "Notifications"),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.person,
                  color: AppColors.mainColor,
                ),
                icon: Icon(
                  Icons.person_2_outlined,
                  color: AppColors.mainColor,
                ),
                label: "Profile"),
          ]),
      body: screens[currentIndex],
    );
  }
}
