import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pocketku/common/format.dart';
import 'package:pocketku/presentation/screens/notification_screen.dart';
import 'package:pocketku/presentation/screens/settings_screen.dart';
import 'package:pocketku/presentation/styles/pallet.dart';
import 'package:pocketku/presentation/styles/typography.dart';
import 'package:pocketku/presentation/widgets/icon_button_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.userData,
  });

  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage:
                    userData['avatar'] != null && userData['avatar'] != ''
                        ? NetworkImage(userData['avatar'])
                        : const AssetImage(
                            'lib/assets/images/profile.jpg',
                          ) as ImageProvider,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    2,
                    (index) => Text(
                      index == 0
                          ? 'Welcome Back👋'
                          : formattedName(userData['user_name'] ?? 'No Name'),
                      style: index == 0
                          ? subtitle2.copyWith(
                              fontWeight: FontWeight.bold,
                              color: secondary30,
                            )
                          : headline4.copyWith(
                              color: secondary50,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              2,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 4),
                child: CustomIconButton(
                  icon: index == 0 ? Iconsax.notification : Iconsax.setting_2,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      index == 0
                          ? NotificationScreen.routeName
                          : SettingsScreen.routeName,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
