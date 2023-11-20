import 'package:bnb_with_bloc/Business_Logic/Landing_Page_Bloc/landing_page_bloc.dart';
import 'package:bnb_with_bloc/Business_Logic/Landing_Page_Bloc/landing_page_event.dart';
import 'package:bnb_with_bloc/Business_Logic/Landing_Page_Bloc/landing_page_state.dart';
import 'package:bnb_with_bloc/Providers/NewsProvider.dart';
import 'package:bnb_with_bloc/models/News.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.newspaper),
    label: 'News',
  ),
];

List<Widget> bottomNavScreen = <Widget>[
  Center(
    child: Card(
      surfaceTintColor: const Color.fromARGB(255, 11, 227, 18),
      elevation: 7,
      child: Container(
        height: 200,
        width: 300,
        child: Center(
          child: Text(
            "Welcome to Danson Solution",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 19,
            ),
          ),
        ),
      ),
    ),
  ),
  _buildWidget(),
];

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "App Bar",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 22,
              ),
            ),
            actions: [
              IconButton(
                icon: state.isDarkTheme
                    ? Icon(
                        Icons.light_mode,
                        size: 30,
                      )
                    : Icon(
                        Icons.dark_mode,
                        size: 30,
                      ), // Icon for theme toggle
                onPressed: () {
                  BlocProvider.of<LandingPageBloc>(context)
                      .add(ToggleThemeEvent());
                },
              ),
            ],
          ),
          body: Center(
            child: bottomNavScreen.elementAt(state.tabIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              BlocProvider.of<LandingPageBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}

Widget _buildWidget() {
  return Container(
    padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome Back",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        Text("News Today",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
        Divider(
          color: Colors.black,
        ),
        Expanded(
          child: Consumer<NewsProvider>(builder: (context, provider, child) {
            if (provider.isLoading == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (provider.news.length > 0) {
                return RefreshIndicator(
                  onRefresh: () async {
                    await provider.fetchData();
                  },
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: provider.news.length,
                      itemBuilder: (context, index) {
                        News currentNews = provider.news[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage:
                                      NetworkImage(currentNews.urlToImage!),
                                ),
                                title: Text(
                                  currentNews.title.toString(),
                                  style: TextStyle(
                                      fontFamily: "Nunito", fontSize: 20),
                                ),
                                subtitle: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      currentNews.author.toString(),
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                      ),
                                    )),
                              ),
                              Text(
                                currentNews.description.toString(),
                                style: TextStyle(
                                    fontFamily: "Montserrat", fontSize: 17),
                              ),
                              Text(currentNews.content.toString(),
                                  style: TextStyle(
                                      fontFamily: "Montserrat", fontSize: 17)),
                              SizedBox(height: 3),
                              Divider(),
                            ],
                          ),
                        );
                      }),
                );
              } else {
                return Text("Data not found");
              }
            }
          }),
          // child: ListView(),
        )
      ],
    ),
  );

//
}
