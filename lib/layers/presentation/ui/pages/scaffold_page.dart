import 'package:dbz_app/layers/presentation/ui/pages/favorites_page.dart';
import 'package:dbz_app/layers/presentation/ui/pages/home_page.dart';
import 'package:dbz_app/layers/presentation/ui/pages/search_page.dart';
import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({super.key});

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  List<Widget> _pagesIndex = [
    SearchPage(),
    HomePage(),
    FavoritesPage(),
  ];
  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pagesIndex[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index != 1) {
            _onItemTapped(index);
          }
        },
        currentIndex: _currentIndex,
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisar'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favoritos'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 12,
        backgroundColor: Colors.black,
        onPressed: () {
          _onItemTapped(1);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27),
        ),
        child: ClipOval(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/dragon_ball_image.png',
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
