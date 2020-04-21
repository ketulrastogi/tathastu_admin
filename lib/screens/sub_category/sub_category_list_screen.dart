import 'package:admin/models/sub_category_model.dart';
import 'package:admin/providers/sub_category_provider.dart';
import 'package:admin/screens/sub_category/update_sub_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubCategoryListScreen extends StatefulWidget {
  @override
  _SubCategoryListScreenState createState() => _SubCategoryListScreenState();
}

class _SubCategoryListScreenState extends State<SubCategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    final List<SubCategory> _subCategoryList =
        Provider.of<List<SubCategory>>(context);
    final SubCategoryProvider _subCategoryProvider =
        Provider.of<SubCategoryProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sub Categories'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _subCategoryProvider.loadValues(SubCategory());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateSubCategory(),
                  ),
                );
              },
              iconSize: 30.0,
            ),
          ],
        ),
        body: (_subCategoryList != null)
            ? ListView.separated(
                padding: EdgeInsets.only(top: 8.0),
                itemCount: _subCategoryList.length,
                itemBuilder: (context, index) {
                  SubCategory _subCategory = _subCategoryList[index];
                  return ListTile(
                    title: Text(_subCategory.name),
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
                                _subCategoryProvider.loadValues(_subCategory);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateSubCategory(_subCategory),
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
                                _subCategoryProvider.removeSubCategory(
                                    _subCategory.subCategoryId);
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
