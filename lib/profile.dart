import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'constants.dart';
import 'package:MediCaP/profile_list_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    Future pickImage() async {
      var image = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        if (image != null) {
          _image = File(image.path);
        } else {
          print('No image selected.');
        }
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      var firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      var uploadTask = firebaseStorageRef.putFile(_image);
    }

    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 12.5,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 6),
            child: Stack(
              children: <Widget>[
                _image == null
                    ? Image.asset(
                        'images/businessman-profile-cartoon_18591-58479.jpg',
                        fit: BoxFit.fill,
                      )
                    : Image.file(
                        _image,
                        fit: BoxFit.fitWidth,
                      ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 3.5,
                    width: kSpacingUnit.w * 5.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Container(
                        height: 30,
                        width: 30,
                        child: MaterialButton(
                          padding: EdgeInsets.only(left: 0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          onPressed: () {
                            pickImage();
                          },
                          child: Icon(
                            LineAwesomeIcons.camera,
                            color: kDarkPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            'Nicolas Adams',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'nicolasadams@gmail.com',
            style: kCaptionTextStyle,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            onPressed: () {
              uploadPic(context);
            },
            color: Colors.blue[200],
            child: Text('Save'),
          )
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            LineAwesomeIcons.arrow_left,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
        ),
        profileInfo,
        SizedBox(width: kSpacingUnit.w * 5),
      ],
    );

    return Builder(
      builder: (context) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              SizedBox(height: kSpacingUnit.w * 5),
              header,
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 150,
                          width: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepPurple,
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Number of donations:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 150,
                          width: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepPurple,
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Number of donations:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // ProfileListItem(
                    //   icon: LineAwesomeIcons.question_circle,
                    //   text: 'Help & Support',
                    // ),
                    // ProfileListItem(
                    //   icon: LineAwesomeIcons.user_plus,
                    //   text: 'Invite a Friend',
                    // ),
                    // RaisedButton(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius:
                    //           BorderRadius.all(Radius.circular(20.0))),
                    //   onPressed: () {},
                    //   color: Colors.blue[300],
                    //   child: Text(
                    //     'logout',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}