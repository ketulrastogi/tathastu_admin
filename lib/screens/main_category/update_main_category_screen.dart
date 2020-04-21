import 'package:admin/models/main_category_model.dart';
import 'package:admin/providers/main_category_provider.dart';
import 'package:admin/screens/select_icon_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateMainCategory extends StatefulWidget {
  final MainCategory mainCategory;

  const UpdateMainCategory([this.mainCategory]);
  @override
  _UpdateMainCategoryState createState() => _UpdateMainCategoryState();
}

class _UpdateMainCategoryState extends State<UpdateMainCategory> {
  final TextEditingController _nameController = TextEditingController();
  String _name;
  String _iconUrl;
  bool _isPublished;
  bool _showOnHome;
  String _subCategoryId;
  @override
  void initState() {
    if (widget.mainCategory == null) {
      //New Record
      _nameController.text = "";
      _isPublished = false;
      _showOnHome = false;
      Future.delayed(Duration.zero, () {
        final mainCategoryProvider =
            Provider.of<MainCategoryProvider>(context, listen: false);
        mainCategoryProvider.loadValues(MainCategory());
      });
    } else {
      //Controller Update
      _nameController.text = widget.mainCategory.name;
      _iconUrl = widget.mainCategory.iconUrl;
      _isPublished = widget.mainCategory.isPublished;
      _showOnHome = widget.mainCategory.showOnHome;
      //State Update
      Future.delayed(Duration.zero, () {
        final mainCategoryProvider =
            Provider.of<MainCategoryProvider>(context, listen: false);
        mainCategoryProvider.loadValues(widget.mainCategory);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MainCategoryProvider _mainCategoryProvider =
        Provider.of<MainCategoryProvider>(context);

    return WillPopScope(
      onWillPop: () {
        _mainCategoryProvider.loadValues(MainCategory());
        Navigator.of(context).pop();
        return;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add New Main Category'),
          ),
          body: Form(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  style: Theme.of(context).textTheme.subtitle.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                  onChanged: (value) {
                    _mainCategoryProvider.changeName(value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: Checkbox(
                    onChanged: (bool value) {
                      print('isPublished : $value');
                      _isPublished = value;
                      _mainCategoryProvider.changeIsPublished(value);
                    },
                    value: _isPublished,
                  ),
                  title: Text('Publish main category.'),
                  // onTap: () {
                  //   _mainCategoryProvider
                  //       .changeIsPublished(!_mainCategoryProvider.isPublished);
                  // },
                ),
                SizedBox(
                  height: 8.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: Checkbox(
                    onChanged: (bool value) {
                      print('showOnHome : $value');
                      _showOnHome = value;
                      _mainCategoryProvider.changeShowOnHome(value);
                    },
                    value: _showOnHome,
                  ),
                  title: Text('Show on home screen.'),
                  // onTap: () {
                  //   _mainCategoryProvider
                  //       .changeShowOnHome(!_mainCategoryProvider.showOnHome);
                  // },
                ),
                SizedBox(
                  height: 8.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 0.0),
                  leading: Container(
                    height: 48.0,
                    width: 48.0,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo.shade50,
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                          )
                        ]),
                    child: SvgPicture.network(_mainCategoryProvider.iconUrl),
                  ),
                  title: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Theme.of(context).accentColor,
                        ),
                        child: FlatButton(
                          child: Text(
                            (_mainCategoryProvider.mainCategoryId == null)
                                ? 'SELECT ICON'
                                : 'CHANGE ICON',
                            style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.button.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectIconScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(16.0),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Theme.of(context).primaryColor,
              child: Text(
                'SUBMIT',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.button.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              onPressed: () {
                _mainCategoryProvider.saveMainCategory();
                Navigator.of(context).pop();
                _mainCategoryProvider.loadValues(MainCategory());
              },
            ),
          ),
        ),
      ),
    );
  }
}
