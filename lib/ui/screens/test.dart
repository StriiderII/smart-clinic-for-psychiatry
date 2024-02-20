/*
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smart_clinic_for_psychiatry/ui/common/components/appTheme/my_theme.dart';

class TestScreen extends StatefulWidget {
  static const String routeName = 'test screen';

  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var viewModel = getIt<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) {
        int selectedIndex = 0;
        late Widget bodyWidget;

        switch (state.runtimeType) {
          case HomeScreenTabState:
            {
              selectedIndex = 0;
              bodyWidget = HomeScreenTab();
            }
            break;
          case NewsScreenState:
            {
              selectedIndex = 1;
              bodyWidget = NewsScreen();
            }
            break;
          case ChatScreenState:
            {
              selectedIndex = 2;
              bodyWidget = ChatScreen();
            }
            break;
          case AssessmentScreenState:
            {
              selectedIndex = 3;
              bodyWidget = AssessmentScreen();
            }
            break;
          case SettingsScreenState:
            selectedIndex = 4;
            bodyWidget = SettingsScreen();
            break;
          default:
            throw Exception("Invalid state: $state");
        }

        return Scaffold(
          backgroundColor: Colors.deepPurple,
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: GNav(
              backgroundColor: MyTheme.primaryLight,
              haptic: true,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              tabBackgroundColor: Colors.blue.withOpacity(0.1),
              activeColor: Colors.white,
              gap: 10,
              onTabChange: (index) {
                viewModel.onTabClick(index);
              },
              tabs: [
                GButton(
                  icon: selectedIndex == 0 ? Icons.home : Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: selectedIndex == 1 ? Icons.newspaper : Icons.newspaper,
                  text: 'Article',
                ),
                GButton(
                  icon: selectedIndex == 2 ? Icons.chat : Icons.chat,
                  text: 'Chat',
                ),
                GButton(
                  icon: selectedIndex == 3
                      ? FontAwesomeIcons.heart
                      : FontAwesomeIcons.heart,
                  text: 'Test',
                ),
                GButton(
                  icon: selectedIndex == 4 ? Icons.settings : Icons.settings,
                  text: 'Settings',
                ),
              ],
            ),
          ),
          body: bodyWidget,
        );
      },
    );
  }
}
*/
