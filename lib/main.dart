import 'package:bnb_with_bloc/Business_Logic/Landing_Page_Bloc/landing_page_bloc.dart';
import 'package:bnb_with_bloc/Business_Logic/Landing_Page_Bloc/landing_page_state.dart';
import 'package:bnb_with_bloc/Presentation/Screens/Landing_Page_Screen/landing_page.dart';
import 'package:bnb_with_bloc/Providers/NewsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsProvider>(
        create: (context) {
          return NewsProvider();
        },
        child: BlocProvider(
            create: (context) => LandingPageBloc(),
            child: BlocBuilder<LandingPageBloc, LandingPageState>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  themeMode:
                      state.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
                  theme: ThemeData.light().copyWith(
                    brightness: Brightness.light,
                    useMaterial3: true,
                    appBarTheme: AppBarTheme(
                      backgroundColor: Color.fromARGB(255, 34, 114, 2),
                      foregroundColor: Colors.white,
                      elevation: 10,
                      iconTheme: IconThemeData(
                        color: Colors.yellow,
                      ),
                    ),
                    dividerColor: Colors.black,
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Colors.white,
                      selectedItemColor: Color.fromARGB(255, 8, 162, 44),
                      elevation: 30,
                    ),
                  ),
                  darkTheme: ThemeData(
                    brightness: Brightness.dark,
                    useMaterial3: true,
                    appBarTheme: AppBarTheme(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 1, 32, 29),
                      elevation: 10,
                      iconTheme: IconThemeData(
                        color: Colors.white,
                      ),
                    ),
                    dividerColor: Colors.white,
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Colors.black,
                      selectedItemColor: Color.fromARGB(255, 4, 134, 34),
                      elevation: 30,
                    ),
                  ),
                  home: LandingPage(),
                );
              },
            )));
  }
}

// Theme(
//                   data:
//                       state.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
//                   child: LandingPage(),
//                 );

// BlocProvider(
//             create: (context) => LandingPageBloc(),
//             child: BlocBuilder<LandingPageBloc, LandingPageState>(
//               builder: (context, state) {
//                 return Theme(
//                   data:
//                       state.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
//                   child: LandingPage(),
//                 );
//               },
//             ),
//           ),

//  MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData.light().copyWith(
//             useMaterial3: true,
//             appBarTheme: AppBarTheme(
//               backgroundColor: Colors.teal,
//               foregroundColor: Colors.white,
//               iconTheme: IconThemeData(
//                 color:  Color.fromARGB(255, 76, 147, 175),
//               ),
//             ),
//           ),
//           darkTheme: ThemeData(
//             useMaterial3: true,
//             appBarTheme: AppBarTheme(
//               backgroundColor: Colors.teal,
//               foregroundColor: Colors.white,
//               iconTheme: IconThemeData(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           home: BlocProvider(
//             create: (context) => LandingPageBloc(),
//             child: BlocBuilder<LandingPageBloc, LandingPageState>(
//               builder: (context, state) {
//                 return Theme(
//                   data:
//                       state.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
//                   child: LandingPage(),
//                 );
//               },
//             ),
//           ),
//         ));
