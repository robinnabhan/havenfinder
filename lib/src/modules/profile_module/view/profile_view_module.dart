import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:havenfinder/src/core/components/responsive/responsive_layout_builder.dart';

import 'package:havenfinder/src/core/components/widget/menu_list_button.dart';
import 'package:havenfinder/src/core/theme/constants.dart';
import 'package:havenfinder/src/modules/app_module/presenter/providers/app_provider.dart';
import 'package:havenfinder/src/modules/app_module/presenter/view_model/app_view_model.dart';
// import 'package:havenfinder/src/modules/user_module/user_navigator_module/presenter/view_model/user_navigator_viewmodel.dart';
// import 'package:vrouter/vrouter.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends ConsumerState<ProfileView>
    with AutomaticKeepAliveClientMixin<ProfileView> {
  @override
  bool get wantKeepAlive => true;
  /* *** *** Build *** *** */
  @override
  Widget build(
    BuildContext context,
  ) {
    super.build(context);

    return ResponsiveLayoutBuilder(
      child: (isWeb, isMobile, width, height) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: Constant.smallAllPadding(
              width: width,
              height: height,
            ),
            children: [
              Padding(
                padding: Constant.tinyTopPadding(
                  height: height,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      // backgroundImage: const AssetImage(
                      //   'assets/images/default_profile_avatar.png',
                      // ),
                      backgroundColor: const Color(0xFFEFEFEF),
                      radius: Constant.radius(
                        width: width,
                        height: height,
                        widthRatio: 0.133,
                        heightRatio: 0.075,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Constant.radius(
                            width: width,
                            height: height,
                            widthRatio: 0.2128,
                            heightRatio: 0.12,
                          ),
                        ),
                        child: Text(
                          '🧑‍🚀',
                          style: TextStyle(
                            fontSize: Constant.radius(
                              width: width,
                              height: height,
                              widthRatio: 0.2128,
                              heightRatio: 0.12,
                            ),
                            height: 1.35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: Constant.smallTopPadding(
                  height: height,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cosmonaut User',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: Constant.tinyTopPadding(
                  height: height,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Basic plan',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Constant.greyColor,
                          ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: Constant.largeVerticalPadding(
              //     height: height,
              //   ),
              //   child: UpgradePlanCard(
              //     width: width,
              //     height: height,
              //   ),
              // ),
              Text(
                'Account',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              MenuListButton(
                text: 'Account info',
                onPressed: () => {
                  // UserNavigatorViewModel.instance.navigationTabsUrl[4] =
                  //     '${context.vRouter.path}/account-info',
                  // context.vRouter.to('account-info'),
                },
                width: width,
                height: height,
                icon: 'assets/icons/user_icon.png',
                margin: false,
              ),
              MenuListButton(
                text: 'Settings',
                onPressed: () => {
                  // UserNavigatorViewModel.instance.navigationTabsUrl[4] =
                  //     '${context.vRouter.path}/settings',
                  // context.vRouter.to('settings'),
                },
                width: width,
                height: height,
                icon: 'assets/icons/settings_icon.png',
                margin: false,
              ),
              MenuListButton(
                text: 'Rate the app',
                onPressed: () async {
                  // final InAppReview inAppReview = InAppReview.instance;
                  // if (await inAppReview.isAvailable()) {
                  //   inAppReview.requestReview();
                  // }
                },
                width: width,
                height: height,
                icon: 'assets/icons/star_outline_icon.png',
                margin: false,
              ),
              MenuListButton(
                text: 'Tell a friend - get 20 items',
                onPressed: () => {},
                //context.vRouter.to('/tell-a-friend'),
                width: width,
                height: height,
                icon: 'assets/icons/emoji_icon.png',
                margin: false,
              ),
              Padding(
                padding: Constant.baseTopPadding(
                  height: height,
                ),
                child: Text(
                  'Help center',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              MenuListButton(
                text: 'Get help',
                onPressed: () => {},
                // context.vRouter.to('/get-help'),
                width: width,
                height: height,
                icon: 'assets/icons/multi_bubble_icon.png',
                margin: false,
              ),
              MenuListButton(
                text: 'FAQs',
                onPressed: () => log('FAQs'),
                width: width,
                height: height,
                icon: 'assets/icons/chat_bubble_question_icon.png',
                margin: false,
              ),
              Padding(
                padding: Constant.baseTopPadding(
                  height: height,
                ),
                child: Text(
                  'Other',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              MenuListButton(
                text: 'Our team',
                onPressed: () => log('Our team'),
                width: width,
                height: height,
                icon: 'assets/icons/group_icon.png',
                margin: false,
              ),
              MenuListButton(
                text: 'Marketplace',
                onPressed: () => log('Marketplace'),
                width: width,
                height: height,
                icon: 'assets/icons/circle_icon.png',
                margin: false,
              ),
              Padding(
                padding: Constant.baseTopPadding(
                  height: height,
                ),
                child: MenuListButton(
                  text: 'Log out',
                  onPressed: () => {},
                  // appViewModel.logoutUser(
                  //   context: context,
                  //   ref: ref,
                  // ),
                  width: width,
                  height: height,
                  icon: 'assets/icons/log_out_icon.png',
                  margin: false,
                ),
              ),
              Padding(
                padding: Constant.xSmallVerticalPadding(
                  height: height,
                ),
                child: Text(
                  'Made with 💙 by HavenFinder',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Constant.greyColor,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
