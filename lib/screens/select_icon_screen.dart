import 'package:admin/models/app_icon_model.dart';
import 'package:admin/providers/main_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectIconScreen extends StatefulWidget {
  @override
  _SelectIconScreenState createState() => _SelectIconScreenState();
}

class _SelectIconScreenState extends State<SelectIconScreen> {
  AppIcon _selectedAppIcon;

  @override
  Widget build(BuildContext context) {
    final List<AppIcon> _appIconList = Provider.of<List<AppIcon>>(context);
    final MainCategoryProvider _mainCategoryProvider =
        Provider.of<MainCategoryProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: (_appIconList != null)
            ? GridView.builder(
                itemCount: _appIconList.length,
                itemBuilder: (context, index) {
                  AppIcon _appIcon = _appIconList[index];
                  return Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          right: 0,
                          bottom: 0,
                          left: 0,
                          child: Material(
                            elevation: (_selectedAppIcon == _appIcon) ? 8 : 0,
                          ),
                        ),
                        Positioned(
                          bottom: 16.0,
                          top: 0.0,
                          left: 12.0,
                          right: 12.0,
                          child: Container(
                            // height: 64.0,
                            padding: EdgeInsets.all(8.0),
                            child: SvgPicture.network(_appIcon.downloadUrl),
                          ),
                        ),
                        Positioned(
                          bottom: 6.0,
                          // left: 20.0,
                          // right: 20.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Center(
                              child: Text(
                                _appIcon.name,
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              print('all ok');
                              setState(() {
                                _selectedAppIcon = _appIcon;
                              });
                            },
                            child: Container(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(16.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'CONFIRM',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.button.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            onPressed: () {
              _mainCategoryProvider.changeAppIcon(_selectedAppIcon);

              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
