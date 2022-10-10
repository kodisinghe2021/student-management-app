import 'package:flutter/material.dart';
import 'package:proacadamy_student_management_app/const_vaues.dart';
import 'package:proacadamy_student_management_app/views/home_screens/sub_screens/chat_list.dart';
import 'package:proacadamy_student_management_app/views/home_screens/sub_screens/home_page.dart';
import 'package:proacadamy_student_management_app/views/home_screens/sub_screens/my_courses.dart';
import 'package:proacadamy_student_management_app/views/home_screens/sub_screens/profile.dart';

class MainScreensHandller extends StatefulWidget {
  const MainScreensHandller({super.key});
  static const pageKey = '/home-page';
  @override
  State<MainScreensHandller> createState() => _MainScreensHandllerState();
}

class _MainScreensHandllerState extends State<MainScreensHandller> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const MyCoursesScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//##############################################################################//
        // appBar: AppBar(
        //   leading: const Icon(Icons.menu),
        //   title: const Text('MainPage'),
        //   actions: const [
        //     Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //       child: Icon(Icons.logout),
        //     )
        //   ],
        // ),

//##############################################################################//

        body: SizedBox(
          width: getScreenSize(context).width,
          height: getScreenSize(context).height,
          child: IndexedStack(
            index: _currentIndex,
            children: screens,
          ),
        ),

//##############################################################################//
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Courses',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
                backgroundColor: Colors.orange,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]),
      ),
    );
  }
}
