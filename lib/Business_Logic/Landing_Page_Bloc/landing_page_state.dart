// landing_page_state.dart

abstract class LandingPageState {
  final int tabIndex;
  final bool isDarkTheme;

  const LandingPageState({required this.tabIndex, required this.isDarkTheme});
}

class LandingPageInitial extends LandingPageState {
  const LandingPageInitial({required int tabIndex, required bool isDarkTheme})
      : super(tabIndex: tabIndex, isDarkTheme: isDarkTheme);
}
