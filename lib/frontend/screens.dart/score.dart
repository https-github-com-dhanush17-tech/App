import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinnacle/constants.dart';
import 'package:pinnacle/frontend/screens.dart/home.dart';
import 'package:pinnacle/frontend/screens.dart/scan_upload.dart';

class ResultScreen extends StatefulWidget {
  int score;
  ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: secondaryBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 40),
          Container(
            height: 275,
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                  "https://image.freepik.com/free-photo/young-asia-lady-feeling-happiness-with-positive-expression-joyful-surprise-funky-dressed-casual-cloth-looking-camera-isolated-blue-background-happy-adorable-glad-woman-rejoices-success_7861-2734.jpg")),
                          Text(
                            "Dhansuh",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            width: 70,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(4294358572).withOpacity(1)),
                            child: Center(
                              child: Text(
                                "10",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg"),
                        ),
                        Text(
                          "Thomas",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 70,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(4294358572).withOpacity(1)),
                          child: Center(
                            child: Text(
                              "10",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                      "https://t4.ftcdn.net/jpg/01/15/85/23/360_F_115852367_E6iIYA8OxHDmRhjw7kOq4uYe4t440f14.jpg")),
                              Text(
                                "Austin",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Color(4294358572).withOpacity(1)),
                                child: Center(
                                  child: Text(
                                    "10",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          TextEditingController _controller =
                              TextEditingController();
                          return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                height: 180,
                                width: MediaQuery.of(context).size.width - 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(4278830841),
                                        Color(4284720383)
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Name of the quiz",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 0,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20),
                                        child: TextField(
                                          controller: _controller,
                                          style: GoogleFonts.poppins(),
                                        )),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        Firestore.instance
                                            .collection("quiz")
                                            .add({
                                          "questions": json.encode(questions),
                                          "name": _controller.text,
                                          "date": DateTime.now(),
                                        }).then((value) {
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20),
                                        child: Container(
                                            width: double.infinity,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Color(4279980225),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text("Done",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        });
                  },
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 10),
                      child: Container(
                        width: 180,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Colors.white.withOpacity(0.3)),
                        child: Center(
                          child: Text(
                            "Make Public!",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Container(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2.1,
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (ctx, i) {
                                return Container(
                                  height: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${i + 1}",
                                          style: GoogleFonts.poppins(
                                              color: secondaryBackgroundColor,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CircleAvatar(
                                                radius: 25,
                                                backgroundImage: NetworkImage(
                                                    "https://t4.ftcdn.net/jpg/01/15/85/23/360_F_115852367_E6iIYA8OxHDmRhjw7kOq4uYe4t440f14.jpg")),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Dhanush ",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  260,
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "3000",
                                                style: GoogleFonts.poppins(
                                                    color: Color(4294358572),
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (ctx, i) =>
                                  SizedBox(height: 10),
                              itemCount: 10),
                        ),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Home()));
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, bottom: 10),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: secondaryBackgroundColor),
                            child: Center(
                              child: Text(
                                "Back to home",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
