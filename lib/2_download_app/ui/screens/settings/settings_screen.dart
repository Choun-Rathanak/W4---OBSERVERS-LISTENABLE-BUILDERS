
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    ThemeColorProvider colorProvider = Provider.of<ThemeColorProvider>(context);  // put this all widget i want to change ui that listen  the ChangeNotifierProvider can assess the data method in ThemeColorProvider 
    return Container(
      color: colorProvider.curTheme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Settings",
            style: AppTextStyles.heading.copyWith(
              color: colorProvider.curTheme.color,
            ),
          ),

          SizedBox(height: 50),

          Text(
            "Theme",
            style: AppTextStyles.label.copyWith(color: AppColors.textLight),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ThemeColor.values
                .map(
                  (theme) => ThemeColorButton(
                    themeColor: theme,
                    isSelected: theme == colorProvider.curTheme,
                    onTap: (value) {
                    colorProvider.setThemeColor(value);  // when tap the color change AND notifies all listeners widget to rebuild change that color tgt 
                     },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
 