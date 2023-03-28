import 'package:flutter/material.dart';
import 'package:mobile/services/api/app_token.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/views/profile/layout/about_profile.dart';
import 'package:mobile/views/profile/layout/account_settings.dart';
import 'package:mobile/views/profile/layout/help_center.dart';
import 'package:mobile/views/profile/widgets/profile_header.dart';
import 'package:mobile/widgets/bottom_bar/bottom_bar.dart';
import 'package:mobile/widgets/text_styles.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 58),
              ProfileHeader(),
              SizedBox(height: 25),
              AccountSettings(),
              SizedBox(height: 25),
              HelpCenter(),
              SizedBox(height: 25),
              AboutProfile(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppbar(index: 4),
    );
  }
}
