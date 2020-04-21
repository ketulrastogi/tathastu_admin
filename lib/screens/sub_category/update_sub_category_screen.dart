import 'package:admin/models/sub_category_model.dart';
import 'package:admin/providers/sub_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateSubCategory extends StatefulWidget {
  final SubCategory subCategory;

  const UpdateSubCategory([this.subCategory]);
  @override
  _UpdateSubCategoryState createState() => _UpdateSubCategoryState();
}

class _UpdateSubCategoryState extends State<UpdateSubCategory> {
  final TextEditingController _nameController = TextEditingController();
  bool _isPublished;

  @override
  void initState() {
    if (widget.subCategory == null) {
      _nameController.text = "";
      _isPublished = false;
      Future.delayed(Duration.zero, () {
        final subCategoryProvider =
            Provider.of<SubCategoryProvider>(context, listen: false);
        subCategoryProvider.loadValues(SubCategory());
      });
    } else {
      _nameController.text = widget.subCategory.name;
      _isPublished = widget.subCategory.isPublished;

      Future.delayed(Duration.zero, () {
        final subCategoryProvider =
            Provider.of<SubCategoryProvider>(context, listen: false);
        subCategoryProvider.loadValues(widget.subCategory);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SubCategoryProvider _subCategoryProvider =
        Provider.of<SubCategoryProvider>(context);

    return WillPopScope(
      onWillPop: () {
        _subCategoryProvider.loadValues(SubCategory());
        Navigator.of(context).pop();
        return;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add New Sub Category'),
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
                    _subCategoryProvider.changeName(value);
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
                      _subCategoryProvider.changeIsPublished(value);
                    },
                    value: _isPublished,
                  ),
                  title: Text('Publish main category.'),
                ),
                SizedBox(
                  height: 8.0,
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
                _subCategoryProvider.saveSubCategory();
                Navigator.of(context).pop();
                _subCategoryProvider.loadValues(SubCategory());
              },
            ),
          ),
        ),
      ),
    );
  }
}
