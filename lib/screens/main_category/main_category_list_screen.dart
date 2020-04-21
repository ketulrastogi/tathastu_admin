import 'package:admin/models/main_category_model.dart';
import 'package:admin/providers/main_category_provider.dart';
import 'package:admin/screens/main_category/update_main_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainCategoryListScreen extends StatefulWidget {
  @override
  _MainCategoryListScreenState createState() => _MainCategoryListScreenState();
}

class _MainCategoryListScreenState extends State<MainCategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    final List<MainCategory> _mainCategoryList =
        Provider.of<List<MainCategory>>(context);
    final MainCategoryProvider _mainCategoryProvider =
        Provider.of<MainCategoryProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Main Categories'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _mainCategoryProvider.loadValues(MainCategory());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateMainCategory(),
                  ),
                );
              },
              iconSize: 30.0,
            ),
          ],
        ),
        body: (_mainCategoryList != null)
            ? ListView.separated(
                padding: EdgeInsets.only(top: 8.0),
                itemCount: _mainCategoryList.length,
                itemBuilder: (context, index) {
                  MainCategory _mainCategory = _mainCategoryList[index];
                  print(_mainCategory.iconUrl);
                  return ListTile(
                    leading: Container(
                      height: 48.0,
                      width: 48.0,
                      padding: EdgeInsets.all(8.0),
                      child: SvgPicture.network(_mainCategory.iconUrl),
                    ),
                    title: Text(_mainCategory.name),
                    trailing: Container(
                      width: 104.0,
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade50,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.mode_edit,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                _mainCategoryProvider.loadValues(_mainCategory);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateMainCategory(_mainCategory),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.pink.shade50,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.delete_forever,
                                color: Theme.of(context).accentColor,
                              ),
                              onPressed: () {
                                _mainCategoryProvider.removeMainCategory(
                                    _mainCategory.mainCategoryId);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
