import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/configuration_view_models.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_paths.dart';

class ConfigurationChangingGenderSetting {
  final GroupButtonController groupButtonController;

  ConfigurationChangingGenderSetting({
    required this.groupButtonController,
  });

  ConfigurationChangingGenderSetting copy({
    GroupButtonController? groupButtonController,
  }) =>
      ConfigurationChangingGenderSetting(
        groupButtonController:
            groupButtonController ?? this.groupButtonController,
      );
}

class ConfigurationChangingGenderNotifier
    extends StateNotifier<ConfigurationChangingGenderSetting> {
  ConfigurationChangingGenderNotifier(this.ref)
      : super(
          ConfigurationChangingGenderSetting(
            groupButtonController: GroupButtonController(),
          ),
        ) {}

  final Ref ref;

  void saveChanges() {
    if (state.groupButtonController.selectedIndex != null) {
      ref.watch(configurationNotifierProvider).gender =
          genderChecking(state.groupButtonController.selectedIndex);
      NavigationService.goBack();
    } else {}
  }

  void navigationBack() {
    state.groupButtonController.unselectAll();
    NavigationService.goBack();
  }

  String genderChecking(int? index) {
    switch (index) {
      case 0:
        return 'Male';
      case 1:
        return 'Female';
      case 2:
        return 'Other';
      default:
        return '';
    }
  }

  // navigationToDone(BuildContext context) {
  //   NavigationService.push(
  //     page: RoutePaths.home,
  //     isNamed: true,
  //   );
  // }

  // navigationToLogin(BuildContext context) {
  //   NavigationService.pushAndRemoveUntil(
  //     isNamed: true,
  //     page: RoutePaths.login,
  //     predicate: (Route<dynamic> route) => false,
  //   );
  // }
}

final configurationChangingGenderNotifierProvider = StateNotifierProvider<
        ConfigurationChangingGenderNotifier,
        ConfigurationChangingGenderSetting>(
    ((ref) => ConfigurationChangingGenderNotifier(ref)));
