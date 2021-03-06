import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/styles/text.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../../core/widgets/custom_text_elevated_button.dart';

class ProfileConfigurationItem extends StatelessWidget {
  const ProfileConfigurationItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.information,
    required this.press,
  }) : super(key: key);

  final String label, information;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: S.dimens.defaultPadding_8,
      ),
      elevation: 1,
      color: S.colors.background_2,
      child: InkWell(
        onTap: press,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: S.dimens.defaultPadding_8,
            vertical: S.dimens.defaultPadding_8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: S.dimens.defaultPadding_8,
                      vertical: S.dimens.defaultPadding_8,
                    ),
                    child: Icon(
                      icon,
                      size: 24,
                      color: S.colors.primary,
                    ),
                  ),
                  SizedBox(
                    width: S.dimens.defaultPadding_8,
                  ),
                  Text(
                    label,
                    style: S.textStyles.titleHeavy,
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: S.dimens.defaultPadding_8,
                    ),
                    child: Icon(
                      icon,
                      size: 24,
                      color: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    width: S.dimens.defaultPadding_8,
                  ),
                  Expanded(
                    child: Text(
                      information,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: S.textStyles.titleLight,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
