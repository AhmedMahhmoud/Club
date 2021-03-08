import 'dart:io';

import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'dart:ui' as ui;
import 'dart:ui';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

import 'package:provider/provider.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:image_pickers/image_pickers.dart';

// ignore: must_be_immutable
class ProposalsScreen extends StatefulWidget {
  var selectedAction = "شكوى";
  @override
  _ProposalsScreenState createState() => _ProposalsScreenState();
}

File imgFile;
// Future<void> _setImage() async {
//   final picker = ImagePicker();
//   PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
//   imgFile = File(pickedFile.path);
// }

final _controller = ScrollController();
// final Completer<PDFViewController> _controllerr =
//     Completer<PDFViewController>();

List<String> actions = ["شكوى", "اقتراح"];
final _formKey = GlobalKey<FormState>();
var isPressed = false;

class _ProposalsScreenState extends State<ProposalsScreen> {
  List<Widget> actionList = [];

  TextEditingController titileController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  var ispreeseds = true;
  File localfile;
  var fileSize = 0;
  @override
  void initState() {
    imgFile = null;
    super.initState();
  }

  Future<void> selectImages() async {
    List<Media> _listImagePaths = await ImagePickers.pickerPaths(
        galleryMode: GalleryMode.image,
        selectCount: 1,
        showGif: true,
        showCamera: true,
        compressSize: 500,
        uiConfig: UIConfig(uiThemeColor: Colors.black),
        cropConfig: CropConfig(enableCrop: false, width: 1, height: 1));
    imgFile = File(_listImagePaths[0].path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    controller: _controller,
                    children: [
                      Column(children: [
                        UserHeader2(),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text("تقديم الشكاوى و المقترحات",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          indent: 50.w,
                          endIndent: 50.w,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                                width: 100.w,
                                height: 40,
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                  elevation: 2,
                                  isExpanded: true,
                                  items: actions.map((String x) {
                                    return DropdownMenuItem<String>(
                                        value: x,
                                        child: Center(
                                          child: Text(
                                            x,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ));
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      widget.selectedAction = value;
                                    });
                                  },
                                  value: widget.selectedAction,
                                )),
                              ),
                              Text(
                                "نوع الطلب",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.selectedAction == "شكوى"
                              ? "قم بأدخال شكواك"
                              : "قم بأدخال اقتراحك",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          color: Colors.grey,
                          indent: 50.w,
                          endIndent: 50.w,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                            textDirection: ui.TextDirection.rtl,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return " برجاء ادخال عنوان لل${widget.selectedAction}";
                                }
                                return null;
                              },
                              controller: titileController,
                              cursorColor: Colors.grey,
                              maxLines: null,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.red[700]),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .textSelectionColor,
                                        width: 4)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .textSelectionColor,
                                        width: 0)),
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.grey),
                                hintText: "العنوان ",
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                            textDirection: ui.TextDirection.rtl,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return " برجاء ادخال موضوع ال${widget.selectedAction}";
                                }
                                return null;
                              },
                              controller: subjectController,
                              cursorColor: Colors.grey,
                              maxLines: null,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.red[700]),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red[700], width: 4)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .textSelectionColor,
                                        width: 0)),
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.grey),
                                hintText: "الموضوع ",
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () async {
                                await selectImages();
                                Timer(
                                  Duration(seconds: 1),
                                  () => _controller.jumpTo(
                                      _controller.position.maxScrollExtent),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.attachment_outlined,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "ارفاق  صورة",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                      imgFile != null
                          ? Container(
                              child: Image.file(
                              imgFile,
                              width: 400,
                              height: 300,
                              fit: BoxFit.cover,
                            ))
                          : Container(),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white)),
                        height: 55.h,
                        child: GFButton(
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            } else {
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: "تم الأرسال بنجاح",
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.red[900]);
                            }
                          },
                          text: "ارسال",
                          size: GFSize.LARGE,
                          shape: GFButtonShape.square,
                          blockButton: true,
                          color: Colors.red[800],
                          fullWidthButton: true,
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                BackkIcon(
                  function: () => Navigator.pop(context),
                ),
                Positioned(
                  top: 40.h,
                  left: 10.w,
                  child: Notofications(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
