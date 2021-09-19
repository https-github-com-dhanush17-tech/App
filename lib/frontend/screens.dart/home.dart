//@dart=2.9
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinnacle/backend/model/model.dart';
import 'package:pinnacle/constants.dart';
import 'package:intl/intl.dart';
import 'package:pinnacle/frontend/screens.dart/quiz.dart';
import 'package:pinnacle/frontend/screens.dart/scan_upload.dart';

class Home extends StatefulWidget {
  String uid;
  Home({this.uid});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/hi.png",
                    width: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Hello,",
                    style: GoogleFonts.poppins(
                        color: primaryHeadingColor,
                        fontSize: 14,
                        height: 1.7,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    " Dhanush!",
                    style: GoogleFonts.poppins(
                        color: primaryHeadingColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  alignment: Alignment.center,
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: secondaryBackgroundColor),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Find Quiz Code",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "Enter the quiz code given by your teacher, and you can start earning points!",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.search, color: Colors.grey, size: 25),
                              SizedBox(
                                width: 10,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Enter the quiz code",
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: secondaryBackgroundColor),
                      child: Column(children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Generate Questions",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            )),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => ScanDocument()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("Start Scanning ",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Icon(Icons.arrow_forward_rounded,
                                      color: Colors.grey)
                                ],
                              ),
                            ),
                          ),
                        )
                      ]))),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Public Quizzes",
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: Firestore.instance.collection("quiz").snapshots(),
                  builder: (context, snapshot) {
                    return snapshot.data == null
                        ? Container()
                        : ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (ctx, i) {
                              var data = snapshot.data.documents[i];
                              return GestureDetector(
                                onTap: () {
                                  var man = json.decode(data["questions"]);
                                  print(man);
                                  for (int i = 0;
                                      i < (data["questions"]).length;
                                      i++) {
                                    print(
                                      man["questions"][i]["answer"],
                                    );
                                    print(
                                      man["questions"][i]["question_statement"],
                                    );
                                    print(man["questions"][i]["options"]);
                                    questions.add(QuestionModel(
                                        answer: man["questions"][i]["answer"],
                                        question: man["questions"][i]
                                            ["question_statement"],
                                        options: man["questions"][i]
                                            ["options"]));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                QuizzScreen(questions)));
                                  }
                                },
                                child: Container(
                                    width: double.infinity,
                                    height: 90,
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, bottom: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            "assets/tag.png",
                                            height: 70,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  data["name"],
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  DateFormat("yyyy-MM-dd")
                                                      .format(DateTime.now())
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              )
                                            ])
                                      ],
                                    )),
                              );
                            },
                            separatorBuilder: (ctx, i) => SizedBox(height: 10),
                            itemCount: snapshot.data.documents.length);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
