//@dart=2.9

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pinnacle/appcolor.dart';
import 'package:pinnacle/backend/data/question_model.dart';
import 'package:pinnacle/backend/model/model.dart';
import 'package:pinnacle/frontend/screens.dart/score.dart';

import '../../constants.dart';

class QuizzScreen extends StatefulWidget {
  List questions;
  QuizzScreen(this.questions);

  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController _controller;
  String btnText = "Next Question";
  bool answered = false;
  int selected_index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: PageView.builder(
          controller: _controller,
          onPageChanged: (page) {
            if (page == widget.questions.length - 1) {
              setState(() {
                btnText = "See Results";
              });
            }
            setState(() {
              answered = false;
            });
          },
          physics: new NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10, top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Computer Science XI1",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white.withOpacity(0.4)),
                            child: Center(
                              child: Text(
                                "59:19",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "${index + 1} . ${widget.questions[index].question}",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 20.0, right: 20),
                          child: Column(children: [
                            for (int i = 0;
                                i < widget.questions[index].options.length;
                                i++)
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: GestureDetector(
                                  onTap: !answered
                                      ? () {
                                          if (widget.questions[index]
                                                  .answerIndex ==
                                              i) {
                                            score++;
                                            print("yes");
                                          } else {
                                            print("no");
                                          }
                                          setState(() {
                                            btnPressed = true;
                                            answered = true;
                                          });
                                        }
                                      : null,
                                  child: Container(
                                    width: double.infinity,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: btnPressed
                                          ? widget.questions[index]
                                                      .answerIndex ==
                                                  i
                                              ? secondaryBackgroundColor
                                                  .withOpacity(0.5)
                                              : Colors.red.withOpacity(0.5)
                                          : Colors.white,
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 15,
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${widget.questions[index].options[i][0].toUpperCase()}${widget.questions[index].options[i].substring(1)}",
                                            style: GoogleFonts.poppins(
                                                color: btnPressed
                                                    ? widget.questions[index]
                                                                .options ==
                                                            selected_index
                                                        ? Colors.white
                                                        : Colors.black
                                                    : Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            Spacer(),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_controller.page?.toInt() ==
                                          widget.questions.length - 1) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ResultScreen(score)));
                                      } else {
                                        _controller.nextPage(
                                            duration:
                                                Duration(milliseconds: 250),
                                            curve: Curves.easeIn);

                                        setState(() {
                                          btnPressed = false;
                                        });
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0.0, right: 0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(17),
                                            color: secondaryBackgroundColor),
                                        child: Center(
                                          child: Text(
                                            btnText,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                // SizedBox(
                                //   height: 50,
                                // ),
                                // Container(
                                //   width: double.infinity,
                                //   height: 65,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(20),
                                //       color: secondaryBackgroundColor),
                                //   child: Padding(
                                //       padding: EdgeInsets.only(
                                //         left: 15,
                                //       ),
                                //       child: Align(
                                //         alignment: Alignment.centerLeft,
                                //         child: Text(
                                //           "Cell Wall",
                                //           style: GoogleFonts.poppins(
                                //               color: Colors.white,
                                //               fontSize: 17,
                                //               fontWeight: FontWeight.w400),
                                //         ),
                                //       )),
                                // ),
                                // SizedBox(
                                //   height: 50,
                                // ),
                                // Container(
                                //   width: double.infinity,
                                //   height: 65,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(20),
                                //   ),
                                //   child: Padding(
                                //       padding: EdgeInsets.only(
                                //         left: 15,
                                //       ),
                                //       child: Align(
                                //         alignment: Alignment.centerLeft,
                                //         child: Text(
                                //           "Lyosome",
                                //           style: GoogleFonts.poppins(
                                //               color: Colors.black,
                                //               fontSize: 17,
                                //               fontWeight: FontWeight.w400),
                                //         ),
                                //       )),
                                // ),
                                )
                          ]),
                        ),
                      ),
                    ))
              ],
            );
          },
          itemCount: widget.questions.length,
        ),
      ),
    );
  }
}
