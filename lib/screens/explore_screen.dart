import 'package:flutter/material.dart';
import 'package:recipe/screens/account_screen.dart';
import 'package:recipe/screens/favorite_screen.dart';
import 'package:recipe/screens/welcome_screen.dart';
import 'package:recipe/shared/color.dart';

class ExploreScreen extends StatefulWidget {
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(index);
    if (index == 2) {
      _scaffoldKey.currentState!.openDrawer();
    } else {
      _pageController.jumpToPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    //take width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: const Text('Recipe App'),
      //   backgroundColor: AppColor.secondaryColor,
      // ),
      body: Center(
          child: PageView(
            controller: _pageController,
            children: const [
              WelcomeScreen(),
              FavoriteScreen(),
            ],
          )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListTile(
                title: const Text(
                  'John Deo',
                  style:
                  TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
                ),
                subtitle: const Text(
                  'john.deo@gmail.com',
                  style:
                  TextStyle(color: Colors.deepOrangeAccent, fontSize: 14),
                ),
                trailing: const Icon(Icons.arrow_circle_left),
                leading: const Icon(Icons.account_circle_rounded),
                onTap: () {},
              ),
            ),
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
              ),
              leading: const Icon(Icons.person_off_rounded),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Order',
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
              ),
              leading: const Icon(Icons.shopping_bag),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Sell',
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
              ),
              leading: const Icon(Icons.currency_rupee),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Exchange',
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
              ),
              leading: const Icon(Icons.currency_exchange),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Favorite',
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
              ),
              leading: const Icon(Icons.favorite),
              onTap: () {
                Navigator.pushNamed(context, '/favorite');
              },
            ),
            ListTile(
              title: const Text(
                'FAQ',
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
              ),
              leading: const Icon(Icons.question_answer),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Contact Us',
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
              ),
              leading: const Icon(Icons.contact_page),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'About the Phone',
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
              ),
              leading: const Icon(Icons.info),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped,
      ),
    );
  }
}
