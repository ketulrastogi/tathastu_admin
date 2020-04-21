import 'dart:io';

import 'package:admin/providers/app_icon_provider.dart';
import 'package:admin/providers/main_category_provider.dart';
import 'package:admin/providers/sub_category_provider.dart';
import 'package:admin/screens/home_screen.dart';
import 'package:admin/services/app_icon_service.dart';
import 'package:admin/services/file_upload_service.dart';
import 'package:admin/services/main_category_service.dart';
import 'package:admin/services/sub_category_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.indigo,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final MainCategoryService _mainCategoryService = MainCategoryService();
    final SubCategoryService _subCategoryService = SubCategoryService();
    final AppIconService _appIconService = AppIconService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainCategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SubCategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppIconProvider(),
        ),
        StreamProvider(
          create: (context) => _appIconService.getAppIcons(),
        ),
        StreamProvider(
          create: (context) => _mainCategoryService.getMainCategories(),
        ),
        StreamProvider(
          create: (context) => _subCategoryService.getSubCategories(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.indigo, accentColor: Colors.pink),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class FileUpload extends StatefulWidget {
  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Upload File'),
          onPressed: () async {
            File selected = await ImagePicker.pickImage(
              source: ImageSource.gallery,
            );
            String folderName = 'Icons';
            FileUploadService fus = FileUploadService();
            fus.uploadFile(folderName, selected);
          },
        ),
      ),
    );
  }
}
