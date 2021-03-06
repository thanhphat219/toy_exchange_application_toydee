import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/services/converter.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/components/swap_profile_card.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/upload_toy_events_main_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/upload_toy_events_view_model.dart';

import '../../../../core/styles/styles.dart';

class UploadToyEvents extends ConsumerWidget {
  const UploadToyEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_2,
        body: Column(
          children: [
            SizedBox(
              height: ScreenUtil().screenHeight / 2.2,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(S.dimens.defaultPaddingVertical_4),
                    child: Image.file(File(ref
                        .watch(mainToyEventSettingNotifierProvider.notifier)
                        .getList()[index])),
                  );
                },
                itemCount: 3,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    activeColor: S.colors.primary,
                    color: S.colors.accent_5,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: ScreenUtil().screenHeight / 2.2,
            //   child: Image.asset(R.images.homeToy_1),
            // ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: S.colors.background_1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(S.dimens.defaultBorderRadius),
                    topRight: Radius.circular(S.dimens.defaultBorderRadius),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: S.dimens.defaultPadding_32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: S.dimens.defaultPaddingVertical_24,
                      ),
                      Text(
                        ref
                            .watch(mainToyEventSettingNotifierProvider)
                            .titleController
                            .text,
                        style: S.textStyles.h3,
                      ),
                      SizedBox(
                        height: S.dimens.defaultPaddingVertical_16,
                      ),
                      Text(
                        ref
                            .watch(mainToyEventSettingNotifierProvider)
                            .descriptionController
                            .text,
                        style: S.textStyles.titleLight,
                      ),
                      SizedBox(
                        height: S.dimens.defaultPaddingVertical_16,
                      ),
                      const SwapProductCard(),
                      SizedBox(
                        height: S.dimens.defaultPaddingVertical_16,
                      ),
                      toyInfo(ref, uploadToyEventsSettingNotifierProvider),
                      SizedBox(
                        height: S.dimens.defaultPaddingVertical_16,
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.typo3,
                            color: S.colors.primary,
                          ),
                          SizedBox(
                            width: S.dimens.defaultPadding_8,
                          ),
                          Expanded(
                            child: Text(
                              Converter.convertCategories(ref
                                  .watch(mainToyEventSettingNotifierProvider)
                                  .groupButtonControllerCategories
                                  .selectedIndexes),
                              style: S.textStyles.titleLight,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      // SizedBox(
                      //   height: S.dimens.defaultPadding_16,
                      // ),
                      bottomButton(
                        ref,
                        uploadToyEventsSettingNotifierProvider,
                        mainToyEventSettingNotifierProvider,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget toyInfo(WidgetRef ref, uploadSwapSettingNotifierProvider) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.faceGrin,
                color: S.colors.primary,
              ),
              SizedBox(
                width: S.dimens.defaultPadding_8,
              ),
              Text(
                Converter.convertCondition(ref
                    .watch(mainToyEventSettingNotifierProvider)
                    .groupButtonControllerCondition
                    .selectedIndex!),
                style: S.textStyles.titleLight,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.child,
                color: S.colors.primary,
              ),
              SizedBox(
                width: S.dimens.defaultPadding_8,
              ),
              Text(
                Converter.convertGenderType(ref
                    .watch(mainToyEventSettingNotifierProvider)
                    .groupButtonControllerGenderType
                    .selectedIndex!),
                style: S.textStyles.titleLight,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.magento,
                color: S.colors.primary,
              ),
              SizedBox(
                width: S.dimens.defaultPadding_8,
              ),
              Text(
                Converter.convertAgeGroup(ref
                    .watch(mainToyEventSettingNotifierProvider)
                    .groupButtonControllerAgeGroup
                    .selectedIndex!),
                style: S.textStyles.titleLight,
              )
            ],
          ),
        ],
      );

  Widget bottomButton(
    WidgetRef ref,
    StateNotifierProvider<UploadToyEventsSettingNotifier,
            UploadToyEventsSetting>
        uploadToyEventsSettingNotifierProvider,
    StateNotifierProvider<MainToyEventSettingNotifier, MainToyEventSetting>
        mainToyEventSettingNotifierProvider,
  ) =>
      SizedBox(
        height: S.dimens.defaultPaddingVertical_88,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "Upload",
                  onPressed: () {
                    ref
                        .watch(uploadToyEventsSettingNotifierProvider.notifier)
                        .uploadToyEventsToFirebase(
                            eventId: ref
                                .watch(uploadToyEventsSettingNotifierProvider)
                                .eventId,
                            imagePathOne: ref
                                .watch(mainToyEventSettingNotifierProvider)
                                .imagePathOne,
                            imagePathTwo: ref
                                .watch(mainToyEventSettingNotifierProvider)
                                .imagePathTwo,
                            imagePathThree: ref
                                .watch(mainToyEventSettingNotifierProvider)
                                .imagePathThree,
                            title: ref
                                .watch(mainToyEventSettingNotifierProvider)
                                .titleController
                                .text,
                            description: ref
                                .watch(mainToyEventSettingNotifierProvider)
                                .descriptionController
                                .text,
                            categories: ref
                                .watch(mainToyEventSettingNotifierProvider)
                                .groupButtonControllerCategories
                                .selectedIndexes,
                            condition: ref
                                .watch(mainToyEventSettingNotifierProvider)
                                .groupButtonControllerCondition
                                .selectedIndex!,
                            genderType: ref
                                .watch(mainToyEventSettingNotifierProvider)
                                .groupButtonControllerGenderType
                                .selectedIndex!,
                            ageGroup: ref
                                .watch(mainToyEventSettingNotifierProvider)
                                .groupButtonControllerAgeGroup
                                .selectedIndex!);
                    // NavigationService.push(
                    //   page: RoutePaths.swapScreenDone,
                    //   isNamed: true,
                    // );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: S.dimens.defaultPadding_8),
                child: CustomIconButton(
                  text: FontAwesomeIcons.pencil,
                  onPressed: () {
                    NavigationService.goBack();
                  },
                  backgroundColor: S.colors.accent_5,
                  color: S.colors.primary,
                ),
              )
            ],
          ),
        ),
      );
}
