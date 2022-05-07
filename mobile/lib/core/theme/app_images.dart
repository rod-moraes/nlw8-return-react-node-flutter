abstract class AppImages {
  String get bug;
  String get idea;
  String get thought;
  String get success;
}

class AppImagesLight implements AppImages {
  @override
  String get bug => 'assets/images/bug.png';

  @override
  String get idea => 'assets/images/idea.png';

  @override
  String get thought => 'assets/images/thought.png';

  @override
  String get success => 'assets/images/success.png';
}

class AppImagesDark extends AppImagesLight {
  @override
  String get logo => 'assets/images/logo_splash_dark.png';

  @override
  String get logoApp => 'assets/images/logo_app_dark.png';
}
