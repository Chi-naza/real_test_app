import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:real_est_app/constants/app_colors.dart';
import 'package:real_est_app/utils/size_config.dart';

class LocationCard extends StatelessWidget {
  final bool isIcon;
  final String? text;
  final double? left;

  const LocationCard({super.key, this.text, required this.isIcon, this.left});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isIcon
          ? SizeConfig.height(context, h: 90)
          : SizeConfig.height(context, h: 170),
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(left: left ?? 0.0),
      padding: EdgeInsets.all(SizeConfig.height(context, h: 20)),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(13),
          topLeft: Radius.circular(13),
          bottomRight: Radius.circular(13),
        ),
      ),
      curve: Curves.fastOutSlowIn,
      child: isIcon
          ? Icon(Iconsax.grid_1, color: Colors.white)
          : Text(
              text ?? "",
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}
