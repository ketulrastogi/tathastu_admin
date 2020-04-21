import 'dart:io';

import 'package:admin/models/app_icon_model.dart';
import 'package:admin/providers/app_icon_provider.dart';
import 'package:admin/services/file_upload_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AppIconListScreen extends StatefulWidget {
  @override
  _AppIconListScreenState createState() => _AppIconListScreenState();
}

class _AppIconListScreenState extends State<AppIconListScreen> {
  _pickImage() async {
    File file = await FilePicker.getFile(
      allowedExtensions: ['svg'],
      type: FileType.custom,
    );
    // File selected = await ImagePicker.pickImage(
    //   source: ImageSource.gallery,
    // );
    String folderName = 'Icons';
    AppIconProvider fus = AppIconProvider();
    fus.saveAppIcon(file);
  }

  @override
  Widget build(BuildContext context) {
    final List<AppIcon> _appIconList = Provider.of<List<AppIcon>>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('App Icons'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _pickImage,
              iconSize: 30.0,
            ),
          ],
        ),
        body: (_appIconList != null)
            ? ListView.separated(
                itemCount: _appIconList.length,
                itemBuilder: (context, index) {
                  AppIcon _appIcon = _appIconList[index];
                  return ListTile(
                    leading: Container(
                      height: 48.0,
                      width: 48.0,
                      padding: EdgeInsets.all(8.0),
                      child: SvgPicture.network(_appIcon.downloadUrl),
                    ),
                    title: Text(_appIcon.name),
                    trailing: IconButton(
                      icon: Icon(Icons.mode_edit),
                      onPressed: () {},
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
