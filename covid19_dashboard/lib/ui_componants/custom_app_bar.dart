import 'package:covid19_dashboard/ui_componants/Themes.dart';
import 'package:covid19_dashboard/ui_componants/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  Function changeTheme;

  @override
  final Size preferredSize;
  final String title;

  CustomAppBar(this.title,this.changeTheme) : preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () =>changeTheme,
            icon: Icon(Themes().isDarkTheme()
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,color: Themes().isDarkTheme()
                ?Colors.amber
                : CustomColors.deepBlue,))
      ],
    );
  }

}
