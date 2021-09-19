//@dart=2.9

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import "home.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:pinnacle/constants.dart';

import 'package:pinnacle/frontend/widgets.dart/tabbar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();

  final picker = ImagePicker();
  File image;

  String imgurl;
  @override
  Widget build(BuildContext context) {
    final TabController _controller =
        TabController(length: 2, vsync: this, initialIndex: 0);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 8),
            TabBarAuth(_controller),
            SizedBox(
              height: 45,
            ),
            Container(
              height: 593,
              child: TabBarView(controller: _controller, children: [
                _signIn(context),
                SingleChildScrollView(
                    physics: BouncingScrollPhysics(), child: _signup(context))
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _signIn(context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Let's Play Quizlet ,",
                style: GoogleFonts.poppins(
                  fontSize: 27,
                  color: secondaryBackgroundColor,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Enter your information below",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: primaryHeadingColor,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email",
              style: GoogleFonts.poppins(color: Colors.grey.withOpacity(0.8)),
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: TextFormField(
            autofocus: false,
            obscureText: false,
            controller: _email,
            // onChanged: (value) {
            //   setState(() {
            //     _email.text = value;
            //   });
            // },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: secondaryBackgroundColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: secondaryBackgroundColor)),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 1),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: GoogleFonts.poppins(color: Colors.grey.withOpacity(0.8)),
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: TextFormField(
            autofocus: false,
            obscureText: false,
            controller: _password,
            // onChanged: (value) {
            //   setState(() {
            //     _password.text = value;
            //   });
            // },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: secondaryBackgroundColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: secondaryBackgroundColor)),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 1),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        SizedBox(height: 50),
        GestureDetector(
          onTap: () {
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _email.text, password: _password.text)
                .then((value) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Home(uid: value.user.uid)));
            });
          },
          child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          colors: [Color(4278830841), Color(4284720383)])),
                  child: Center(
                    child: Text("Login",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ))),
        )
      ],
    );
  }

  Widget _signup(context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Let's Play Quizlet ,",
                style: GoogleFonts.poppins(
                  fontSize: 27,
                  color: secondaryBackgroundColor,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Thank you for joining us",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: primaryHeadingColor,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Name",
              style: GoogleFonts.poppins(color: Colors.grey.withOpacity(0.8)),
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: TextFormField(
            autofocus: false,
            obscureText: false,
            controller: _name,
            // onChanged: (value) {
            //   setState(() {
            //     _name.text = value;
            //   });
            // },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: secondaryBackgroundColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: secondaryBackgroundColor)),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 1),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email",
              style: GoogleFonts.poppins(color: Colors.grey.withOpacity(0.8)),
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: TextFormField(
            autofocus: false,
            obscureText: false,
            controller: _email,
            // onChanged: (value) {
            //   setState(() {
            //     _email.text = value;
            //   });
            // },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: secondaryBackgroundColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: secondaryBackgroundColor)),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 1),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: GoogleFonts.poppins(color: Colors.grey.withOpacity(0.8)),
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: TextFormField(
            autofocus: false,
            controller: _password,
            // onChanged: (value) {
            //   setState(() {
            //     _password.text = value;
            //   });
            // },
            obscureText: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: secondaryBackgroundColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: secondaryBackgroundColor)),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 1),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Profile Photo",
              style: GoogleFonts.poppins(color: Colors.grey.withOpacity(0.8)),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: GestureDetector(
            onTap: () async {
              final pickedimage =
                  await picker.getImage(source: ImageSource.gallery);

              if (pickedimage != null) {
                setState(() {
                  image = File(pickedimage.path);
                });
              }
            },
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: image == null
                  ? Icon(
                      Icons.upload_file,
                      color: Colors.grey,
                      size: 100,
                    )
                  : Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(image), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      )),
            ),
          ),
        ),
        SizedBox(height: 50),
        GestureDetector(
          onTap: () async {
            final ref = FirebaseStorage.instance
                .ref()
                .child('${DateTime.now()}user_image');

            await ref.putFile(image).onComplete;
            imgurl = await ref.getDownloadURL();
            print("Image URL: " + imgurl);
            FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: _email.text, password: _password.text)
                .then((value) {
              Firestore.instance
                  .collection("users")
                  .document(value.user.uid)
                  .setData({
                "name": _name.text,
                "email": _email.text,
                "profile_photo": imgurl
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Home(uid: value.user.uid)));
            });
          },
          child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          colors: [Color(4278830841), Color(4284720383)])),
                  child: Center(
                    child: Text("SignUp",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ))),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
