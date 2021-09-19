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
  int total_questions;
  ResultScreen(this.score, this.total_questions);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setState(() {
      questions = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: secondaryBackgroundColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("${widget.score}/${widget.total_questions}",
                      style: GoogleFonts.poppins(
                        fontSize: 120,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Text('is your score',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Home()));
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      "Back to home",
                      style: GoogleFonts.poppins(
                          color: secondaryBackgroundColor,
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
    );
  }
}
