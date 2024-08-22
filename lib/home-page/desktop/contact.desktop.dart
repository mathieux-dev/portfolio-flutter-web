import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portifolio/statics/data_values.dart';
import 'package:portifolio/statics/key_holders.dart';
import 'package:portifolio/themes/app_theme.dart';
import 'package:portifolio/widgets/bars/social-media.widget.dart';
import 'package:portifolio/widgets/texts/frame-tittle.widget.dart';

class DesktopContact extends StatelessWidget {
  const DesktopContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.contactKey,
      color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FrameTitle(
                title: DataValues.contactTitle,
                description: DataValues.contactDescription),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(DataValues.contactBanner,
                    style: TextStyle(
                      fontSize: AppThemeData
                          .darkTheme.textTheme.titleMedium!.fontSize,
                      fontWeight: AppThemeData
                          .darkTheme.textTheme.titleLarge!.fontWeight,
                      color: AppThemeData.textWhite,
                    )),
                const SizedBox(width: 4.0),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        const ClipboardData(text: DataValues.contactEmail),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Email successfully copied to clipboard',
                          textAlign: TextAlign.center,
                          style: AppThemeData.darkTheme.textTheme.bodyLarge,
                        ),
                        duration: const Duration(seconds: 2),
                      ));
                    },
                    child: Tooltip(
                      message: 'Click to copy email to clipboard',
                      child: Text(
                        DataValues.contactEmail,
                        style: TextStyle(
                          fontSize: AppThemeData
                              .darkTheme.textTheme.titleMedium!.fontSize,
                          fontWeight: AppThemeData
                              .darkTheme.textTheme.titleLarge!.fontWeight,
                          color: AppThemeData.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            const SocialMedia(),
          ],
        ),
      ),
    );
  }
}