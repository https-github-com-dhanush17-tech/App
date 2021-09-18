//@dart=2.9

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinnacle/constants.dart';

class TabBarAuth extends StatefulWidget {
  final TabController tabController;
  TabBarAuth(this.tabController);

  @override
  _TabBarAuthState createState() => _TabBarAuthState();
}

class _TabBarAuthState extends State<TabBarAuth> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.3)),
            child:
                // Row(
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         widget.tabController.animateTo(0);
                //       },
                //       child: Container(
                //           width: (MediaQuery.of(context).size.width / 2) - 40,
                //           height: 50,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //               child: Text(
                //             "Login",
                //             style: GoogleFonts.poppins(
                //               fontSize: 15,
                //               color: primaryHeadingColor,
                //             ),
                //           ))),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         widget.tabController.animateTo(1);
                //       },
                //       child: Container(
                //         width: (MediaQuery.of(context).size.width / 2),
                //         height: 50,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: secondaryBackgroundColor),
                //         child: Center(
                //             child: Text(
                //           "SignUp",
                //           style: GoogleFonts.poppins(
                //             fontSize: 15,
                //             color: primarySubHeadingColor,
                //           ),
                //         )),
                //       ),
                //     )
                //   ],
                // )),
                TabBar(
              onTap: (index) {
                setState(() {});
              },
              controller: widget.tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              automaticIndicatorColorAdjustment: true,
              indicator: ShapeDecoration(
                  color: secondaryBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              tabs: [
                Tab(
                    icon: Text("Login",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: widget.tabController.index == 0
                                ? Colors.white
                                : secondaryBackgroundColor))),
                Tab(
                    icon: Text("SignUp",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: widget.tabController.index == 1
                                ? Colors.white
                                : secondaryBackgroundColor))),
              ],
            )));
  }
}
