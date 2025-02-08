import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:real_est_app/constants/app_colors.dart';
import 'package:real_est_app/core/home_screen.dart';
import 'package:real_est_app/core/search_screen.dart';
import 'package:real_est_app/utils/size_config.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int navIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dashboardScreens[navIndex],
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.darkBg,
        onPressed: () {},
        label: Container(
          width: SizeConfig.width(context, w: 245),
          decoration: BoxDecoration(
              // color: Colors.red,
              // borderRadius: BorderRadius.circular(20),
              ),
          child: Row(
            spacing: 13,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(navbarItems.length, (index) {
              var item = navbarItems[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    navIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.all(navIndex == index ? 12 : 10),
                  decoration: BoxDecoration(
                    color: navIndex == index
                        ? AppColors.primary
                        : Colors.black.withValues(alpha: 0.7),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item["icon"],
                    size: 22.0,
                    color: Colors.white,
                  ),
                ),
              );
            }),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        extendedPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth(context) * 0.02, vertical: 10),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  List<Widget> dashboardScreens = [
    // search
    const SearchScreen(),
    // messaging
    const Scaffold(body: Center(child: Text("Messaging"))),
    // home
    const HomeScreen(),
    // favorites
    const Scaffold(body: Center(child: Text("Favorites"))),
    // profile
    const Scaffold(body: Center(child: Text("Profile"))),
  ];

  List<Map<String, dynamic>> navbarItems = [
    {"icon": Iconsax.search_normal_1},
    {"icon": Iconsax.message_text_15},
    {"icon": Iconsax.home_14},
    {"icon": Icons.favorite},
    {"icon": Icons.person_2_rounded},
  ];
}
