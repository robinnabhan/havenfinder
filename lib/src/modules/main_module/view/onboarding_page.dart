import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:havenfinder/main.dart';
import 'package:havenfinder/src/core/components/widget/primary_button.dart';
import 'package:havenfinder/src/modules/home_module/view/home_view_model.dart';
import 'package:havenfinder/src/modules/main_module/view/dashboard_screen.dart';

import 'package:havenfinder/src/modules/profile_module/view/profile_view_module.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:havenfinder/src/core/theme/constants.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => DashboardScreen(
              //key: UniqueKey(),
              //location: '/',
              child: const HomeView())),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/images/bluegraphic.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      // bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalFooter: Padding(
        padding: Constant.hugeBottomPadding(height: 1300),
        child: PrimaryButton(
            onTap: () => _onIntroEnd(context),
            text: "Skip",
            loading: false,
            disabled: false,
            margin: true,
            width: 2000),
      ),
      // globalFooter: SizedBox(

      //   width: double.infinity,
      //   height: 60,
      //   child:
      //       // PrimaryButton(
      //       //     onTap: () => _onIntroEnd(context),
      //       //     text: 'Let\'s go right away!',
      //       //     loading: false,
      //       //     disabled: false,
      //       //     margin: false,
      //       //     width: 300),
      //       ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(
      //           fontSize: 16.0,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "Full Screen Page",
          body:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 40),
            fullScreen: false,
            bodyFlex: 10,
            imageFlex: 8,
            safeArea: 10,
            pageColor: Colors.transparent,
          ),
        ),
        PageViewModel(
          title: "Full Screen Page",
          body:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 40),
            fullScreen: false,
            bodyFlex: 10,
            imageFlex: 8,
            safeArea: 10,
            pageColor: Colors.transparent,
          ),
        ),
        PageViewModel(
          title: "Full Screen Page",
          body:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 40),
            fullScreen: false,
            bodyFlex: 10,
            imageFlex: 8,
            safeArea: 10,
            pageColor: Colors.transparent,
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback

      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      showDoneButton: false,
      showNextButton: false,
      //rtl: true, // Display as right-to-left
      // back: const Icon(Icons.arrow_back),
      // overrideSkip: PrimaryButton(
      //   onTap: () => {},
      //   text: "Skip",
      //   width: 300,
      //   disabled: false,
      //   loading: false,
      //   margin: false,
      // ),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(50),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
