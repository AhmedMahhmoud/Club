import 'package:demo_club/Models/UserModel.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

final _formKey = GlobalKey<FormState>();
var isEditable = false;

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    isEditable = false;
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserData>(context, listen: false).user;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: WaveClipperOne(),
                        child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(5),
                            color: Colors.red[800],
                            height: 150.h,
                            child: Container()),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextWidgetProfile(
                                  labelName: "اسم المستخدم",
                                ),
                                TextFieldProfile(
                                  controller: nameController,
                                  name: user.name,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextWidgetProfile(
                                  labelName: "رقم التليفون",
                                ),
                                TextFieldProfile(
                                  name: user.phone,
                                  controller: phoneController,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextWidgetProfile(
                                  labelName: "البريد الألكترونى",
                                ),
                                TextFieldProfile(
                                  controller: emailController,
                                  name: user.email,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 100.h),
                        child: Container(
                          height: 50.h,
                          child: GFButton(
                            onPressed: () {
                              setState(() {
                                isEditable = !isEditable;
                              });

                              if (!isEditable) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return YesNoAlert(
                                      content: "",
                                      emailController: emailController,
                                      nameController: nameController,
                                      phoneController: phoneController,
                                      title: "هل تريد حفظ التعديل؟",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                );
                              }
                            },
                            text:
                                !isEditable ? " تعديل البيانات" : "حفظ التعديل",
                            size: GFSize.LARGE,
                            shape: GFButtonShape.square,
                            blockButton: true,
                            color: Colors.red[900],
                            fullWidthButton: true,
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 60.h,
                  right: 130.w,
                  child: Container(
                    width: 130.w,
                    height: 130.h,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://scontent.fcai21-2.fna.fbcdn.net/v/t1.0-9/79803978_2206482966119329_7485546926507556864_n.jpg?_nc_cat=108&ccb=3&_nc_sid=174925&_nc_eui2=AeHHQqdJBe1wPzn5bN-SOqIRtDQyKomkcn20NDIqiaRyfe1QwPHwKm5pkbWX0A0KvHxDNuCahayPeOmbX7gWDbNG&_nc_ohc=-7xnIwcJ6JcAX8sKi4C&_nc_ht=scontent.fcai21-2.fna&oh=05115c7a72aa71660088d476e3121e95&oe=605DC125"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              BackkIcon()
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidgetProfile extends StatelessWidget {
  final String labelName;
  const TextWidgetProfile({
    this.labelName,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        labelName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}

class TextFieldProfile extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  const TextFieldProfile({
    this.controller,
    this.name,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return "مطلوب";
        }
        return null;
      },
      enabled: isEditable,
      controller: controller,
      autofocus: isEditable,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: new InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          hintText: name,
          hintStyle: TextStyle(
              color: isEditable ? Colors.white : Colors.grey,
              fontSize: 14,
              letterSpacing: 1)),
    );
  }
}

class YesNoAlert extends StatelessWidget {
  final String title;
  final String content;
  final Function onPressed;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  YesNoAlert(
      {this.title,
      this.content,
      @required this.onPressed,
      this.emailController,
      this.nameController,
      this.phoneController});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        child: Container(
          height: 190.h,
          width: 250.w,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: <Widget>[
                      Center(
                          child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red[700],
                            fontWeight: FontWeight.w900),
                      )),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          content,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 5.0,
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          minWidth: 110.w,
                          height: 30.h,
                          child: Text(
                            "لا",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Material(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15.0),
                        child: MaterialButton(
                          onPressed: () {
                            Provider.of<UserData>(context, listen: false)
                                .update(User(
                                    email: emailController.text,
                                    name: nameController.text,
                                    phone: phoneController.text));
                            Fluttertoast.showToast(
                                    msg: "تم الحفظ بنجاح",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0)
                                .then((value) => Navigator.pop(context));
                          },
                          minWidth: 110.w,
                          height: 30.h,
                          child: Text(
                            "نعم",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }
}
