import 'package:admin/screens/app_icon/app_icon_list_screen.dart';
import 'package:admin/screens/main_category/main_category_list_screen.dart';
import 'package:admin/screens/sub_category/sub_category_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Ketul Rastogi'),
                accountEmail: Text('+91-9408393331'),
                currentAccountPicture: Icon(
                  Icons.person,
                  size: 48.0,
                  color: Colors.white,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text('Main Category'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainCategoryListScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.bubble_chart),
                title: Text('Sub Category'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubCategoryListScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.apps),
                title: Text('Category'),
              ),
              ListTile(
                leading: Icon(Icons.assistant),
                title: Text('App Icons'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppIconListScreen(),
                    ),
                  );
                },
              ),
              Divider(
                indent: 56.0,
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('User Pages'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
