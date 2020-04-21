// import 'package:admin/models/app_icon_model.dart';
// import 'package:admin/models/main_category_model.dart';
// import 'package:admin/models/mini_category_model.dart';
// import 'package:admin/models/sub_category_model.dart';
// import 'package:admin/providers/main_category_provider.dart';
// import 'package:admin/providers/sub_category_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class SelectMainCategoryScreen extends StatefulWidget {
//   final SubCategory subCategory;

//   const SelectMainCategoryScreen([this.subCategory]);
//   @override
//   _SelectMainCategoryScreenState createState() =>
//       _SelectMainCategoryScreenState();
// }

// class _SelectMainCategoryScreenState extends State<SelectMainCategoryScreen> {
//   MiniCategoryModel _selectedMainCategory;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.subCategory != null && widget.subCategory.mainCategory != null) {
//       _selectedMainCategory = widget.subCategory.mainCategory;
//       Future.delayed(Duration.zero, () {
//         final SubCategoryProvider subCategoryProvider =
//             Provider.of<SubCategoryProvider>(context, listen: false);
//         subCategoryProvider.loadValues(widget.subCategory);
//       });
//     } else {
//       Future.delayed(Duration.zero, () {
//         final SubCategoryProvider subCategoryProvider =
//             Provider.of<SubCategoryProvider>(context, listen: false);
//         subCategoryProvider.loadValues(SubCategory());
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<MainCategory> _mainCategoryList =
//         Provider.of<List<MainCategory>>(context);
//     final SubCategoryProvider _subCategoryProvider =
//         Provider.of<SubCategoryProvider>(context);
//     return SafeArea(
//       child: Scaffold(
//         body: (_mainCategoryList != null)
//             ? GridView.builder(
//                 itemCount: _mainCategoryList.length,
//                 itemBuilder: (context, index) {
//                   MainCategory _mainCategory = _mainCategoryList[index];
//                   return Container(
//                     child: Stack(
//                       children: <Widget>[
//                         Positioned(
//                           top: 0,
//                           right: 0,
//                           bottom: 0,
//                           left: 0,
//                           child: Material(
//                             elevation: (_selectedMainCategory != null &&
//                                     _selectedMainCategory.id ==
//                                         _mainCategory.mainCategoryId)
//                                 ? 8
//                                 : 0,
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 16.0,
//                           top: 0.0,
//                           left: 12.0,
//                           right: 12.0,
//                           child: Container(
//                             // height: 64.0,
//                             padding: EdgeInsets.all(8.0),
//                             child: SvgPicture.network(_mainCategory.iconUrl),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 6.0,
//                           // left: 20.0,
//                           // right: 20.0,
//                           child: Container(
//                             width: MediaQuery.of(context).size.width / 5,
//                             child: Center(
//                               child: Text(
//                                 _mainCategory.name,
//                                 style: GoogleFonts.lato(
//                                   textStyle: Theme.of(context)
//                                       .textTheme
//                                       .button
//                                       .copyWith(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 0,
//                           bottom: 0,
//                           left: 0,
//                           right: 0,
//                           child: InkWell(
//                             onTap: () {
//                               setState(() {
//                                 _selectedMainCategory = MiniCategoryModel(
//                                   id: _mainCategory.mainCategoryId,
//                                   name: _mainCategory.name,
//                                 );
//                               });
//                             },
//                             child: Container(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 5),
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               ),
//         bottomNavigationBar: Container(
//           padding: EdgeInsets.all(16.0),
//           child: RaisedButton(
//             color: Theme.of(context).primaryColor,
//             padding: EdgeInsets.symmetric(vertical: 16.0),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: Text(
//               'CONFIRM',
//               style: GoogleFonts.lato(
//                 textStyle: Theme.of(context).textTheme.button.copyWith(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//               ),
//             ),
//             onPressed: () {
//               _subCategoryProvider.changeMainCategory(_selectedMainCategory);

//               Navigator.of(context).pop();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
