import 'package:bloc/bloc.dart';
import 'package:bnb_with_bloc/Business_Logic/Landing_Page_Bloc/landing_page_event.dart';
import 'package:bnb_with_bloc/Business_Logic/Landing_Page_Bloc/landing_page_state.dart';

// landing_page_bloc.dart

// landing_page_bloc.dart

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc()
      : super(const LandingPageInitial(tabIndex: 0, isDarkTheme: false)) {
    on<LandingPageEvent>((event, emit) {
      if (event is TabChange) {
        print(event.tabIndex);
        emit(LandingPageInitial(
            tabIndex: event.tabIndex, isDarkTheme: state.isDarkTheme));
      } else if (event is ToggleThemeEvent) {
        emit(LandingPageInitial(
            tabIndex: state.tabIndex, isDarkTheme: !state.isDarkTheme));
      }
    });
  }
}
