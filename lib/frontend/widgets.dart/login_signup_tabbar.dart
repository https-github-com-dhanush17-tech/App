import 'package:flutter/material.dart';
import 'package:pinnacle/constants.dart';

class TabBarAuth extends StatefulWidget {
  const TabBarAuth({Key? key}) : super(key: key);

  @override
  _TabBarAuthState createState() => _TabBarAuthState();
}

class _TabBarAuthState extends State<TabBarAuth> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.3)),
          child: Row(
            children: [
              Container(
                  width: (MediaQuery.of(context).size.width / 2) - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 15,
                      color: primaryHeadingColor,
                    ),
                  ))),
              Container(
                width: (MediaQuery.of(context).size.width / 2),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondaryBackgroundColor),
                child: Center(
                    child: Text(
                  "SignUp",
                  style: TextStyle(
                    fontSize: 15,
                    color: primarySubHeadingColor,
                  ),
                )),
              )
            ],
          )),
    );
  }
}
