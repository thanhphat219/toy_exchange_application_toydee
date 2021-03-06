import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';

import '../../routing/navigation_service.dart';
import '../../styles/styles.dart';
import '../../styles/text.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: buildTitle(T.onb1Title),
            bodyWidget: buidBody(T.onb1Content),
            image: buildImage(T.onb1Image),
            decoration: buildDecoration(),
          ),
          PageViewModel(
            titleWidget: buildTitle(T.onb2Title),
            bodyWidget: buidBody(T.onb2Content),
            image: buildImage(T.onb2Image),
            decoration: buildDecoration(),
          ),
          PageViewModel(
            titleWidget: buildTitle(T.onb3Title),
            bodyWidget: buidBody(T.onb3Content),
            image: buildImage(T.onb3Image),
            decoration: buildDecoration(),
          ),
        ],
        done: Center(
          child: Text(
            T.onbDone,
            style: S.textStyles.h4,
          ),
        ),
        onDone: () {
          NavigationService.push(isNamed: true, page: RoutePaths.login);
        },
        nextStyle: TextButton.styleFrom(
          backgroundColor: S.colors.primary,
          minimumSize: const Size(100, 50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        doneStyle: TextButton.styleFrom(
          backgroundColor: S.colors.primary,
          minimumSize: const Size(100, 50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        next: Center(
          child: Text(
            T.onbNext,
            style: S.textStyles.h4,
            textAlign: TextAlign.center,
          ),
        ),
        skip: Text(
          T.onbSkip,
          style: S.textStyles.h4,
        ),
        onSkip: () {
          NavigationService.pushReplacement(
              isNamed: true, page: RoutePaths.login);
        },
        controlsMargin:
            EdgeInsets.symmetric(vertical: S.dimens.defaultPadding_32),
        controlsPosition: const Position(bottom: 0, left: -10, right: 0),
        controlsPadding: const EdgeInsets.only(right: 30),
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        dotsDecorator: buildDotsShape(),
        isProgressTap: false,
        freeze: false,
        animationDuration: 400,
      ),
    );
  }

  buildImage(String path) {
    return Center(
      child: Image.asset(
        path,
        scale: 1,
      ),
    );
  }

  buildDecoration() {
    return PageDecoration(
      titlePadding: EdgeInsets.all(
        S.dimens.defaultPadding_32,
      ),
      bodyPadding: EdgeInsets.symmetric(
        horizontal: S.dimens.defaultPadding_32,
      ),
      imagePadding: EdgeInsets.zero,
      contentMargin: EdgeInsets.zero,
      footerPadding: EdgeInsets.zero,
      imageFlex: 1,
    );
  }

  buildDotsShape() {
    return DotsDecorator(
        color: S.colors.gray_1,
        activeColor: S.colors.primary,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
  }

  buidBody(String content) {
    return Text(
      content,
      textAlign: TextAlign.left,
      style: S.textStyles.titleHeavy,
    );
  }

  buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: S.textStyles.h5,
    );
  }
}
