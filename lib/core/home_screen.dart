import 'package:flutter/material.dart';
import 'package:real_est_app/constants/app_colors.dart';
import 'package:real_est_app/constants/app_images.dart';
import 'package:real_est_app/utils/size_config.dart';
import 'package:real_est_app/widgets/home_room_display_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> locationFadeAnimation;
  late Animation<double> textFadeAnimation;
  late Animation<double> scaleProfilePicAnimation;
  late Animation<double> scaleStatContainersAnimation;
  late Animation<Offset> slideBodyAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // fade
    locationFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_controller);
    textFadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    //slide
    slideBodyAnimation = Tween<Offset>(begin: Offset(0, 20), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    // scale
    scaleProfilePicAnimation =
        Tween<double>(begin: 0, end: 1).animate(_controller);
    scaleStatContainersAnimation =
        Tween<double>(begin: 0, end: 1).animate(_controller);

    // _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor,
              AppColors.primary.withValues(alpha: 0.3),
              AppColors.primary.withValues(alpha: 0.3),
              AppColors.primary.withValues(alpha: 0.3),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.width(context, w: 10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.height(context, h: 7)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.gold,
                                ),
                                FadeTransition(
                                  opacity: locationFadeAnimation,
                                  child: Text(
                                    "Saint Petersburg",
                                    style: TextStyle(
                                      color: AppColors.gold,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ScaleTransition(
                            scale: scaleProfilePicAnimation,
                            child: CircleAvatar(
                              foregroundImage: AssetImage(AppImages.profile),
                              radius: SizeConfig.screenHeight(context) * 0.03,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.height(context, h: 40)),
                      FadeTransition(
                        opacity: textFadeAnimation,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi Marina",
                              style: TextStyle(
                                fontSize: SizeConfig.height(context, h: 50),
                                color: AppColors.gold,
                              ),
                            ),
                            Text(
                              "let's select your",
                              style: TextStyle(
                                fontSize: SizeConfig.height(context, h: 70),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "perfect place",
                              style: TextStyle(
                                height: 0,
                                fontSize: SizeConfig.height(context, h: 70),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.height(context, h: 50)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ScaleTransition(
                            scale: scaleStatContainersAnimation,
                            child: Container(
                              height: SizeConfig.height(context, h: 380),
                              width: SizeConfig.height(context, h: 380),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          SizeConfig.height(context, h: 20)),
                                  Text(
                                    "BUY",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.height(context, h: 50)),
                                  Text(
                                    "1034",
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.height(context, h: 100),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "offers",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.width(context, w: 10)),
                          ScaleTransition(
                            scale: scaleStatContainersAnimation,
                            child: Container(
                              height: SizeConfig.height(context, h: 380),
                              width: SizeConfig.width(context, w: 150),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          SizeConfig.height(context, h: 20)),
                                  Text(
                                    "RENT",
                                    style: TextStyle(
                                      color: AppColors.gold,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.height(context, h: 50)),
                                  Text(
                                    "2 212",
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.height(context, h: 90),
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.gold,
                                    ),
                                  ),
                                  Text(
                                    "offers",
                                    style: TextStyle(
                                      color: AppColors.gold,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Second Half
                SizedBox(height: SizeConfig.height(context, h: 100)),
                SlideTransition(
                  position: slideBodyAnimation,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.height(context, h: 20),
                      horizontal: SizeConfig.width(context, w: 10),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        HomeRoomDisplayWidget(
                          text: 'Gladkova St., 25',
                          image: AppImages.room1,
                        ),
                        SizedBox(height: SizeConfig.height(context, h: 20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: SizeConfig.width(context, w: 170),
                              child: HomeRoomDisplayWidget(
                                text: 'Gubina St., 11',
                                image: AppImages.staircase,
                                height: SizeConfig.height(context, h: 700),
                                top: SizeConfig.height(context, h: 560),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: SizeConfig.width(context, w: 170),
                                  child: HomeRoomDisplayWidget(
                                    text: 'Trefoleva St., 43',
                                    image: AppImages.room2,
                                    height: SizeConfig.height(context, h: 340),
                                    top: SizeConfig.height(context, h: 200),
                                  ),
                                ),
                                SizedBox(
                                    height: SizeConfig.height(context, h: 20)),
                                SizedBox(
                                  width: SizeConfig.width(context, w: 170),
                                  child: HomeRoomDisplayWidget(
                                    text: 'Sedova St., 22',
                                    image: AppImages.room3,
                                    height: SizeConfig.height(context, h: 340),
                                    top: SizeConfig.height(context, h: 200),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.height(context, h: 180)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
