import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:widget_nlw8/core/core.dart';

import '../../shared/floating_widget/floating_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        backgroundColor: AppTheme.colors.background,
        floatingActionButton:
            FloatingWidget(screenshotController: screenshotController),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: InkWell(
              onTap: () {
                AppThemeController().toggleThemeMode();
              },
              borderRadius: BorderRadius.circular(4),
              child: Ink(
                height: 40,
                decoration: BoxDecoration(
                  color: AppTheme.colors.brand,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                    child: Text(
                  "Mudar o tema: ${AppThemeController().themeMode}",
                  style: AppTheme.textStyles.buttonOnBrandColor,
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
