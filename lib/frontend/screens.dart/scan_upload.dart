//@dart=2.9

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:lottie/lottie.dart';
import 'package:pinnacle/backend/model/model.dart';
import 'package:pinnacle/frontend/screens.dart/quiz.dart';
import 'package:record/record.dart';

import '../../constants.dart';

class ScanDocument extends StatefulWidget {
  @override
  _ScanDocumentState createState() => _ScanDocumentState();
}

class _ScanDocumentState extends State<ScanDocument> {
  scandoc() {
    Future.delayed(Duration(seconds: 1), () {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (ctx) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: [Color(4278830841), Color(4284720383)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        // XFile image = await ImagePicker()
                        //     .pickImage(
                        //         source:
                        //             ImageSource.camera);
                        final taken =
                            await picker.getImage(source: ImageSource.camera);
                        if (taken != null) {
                          setState(() {
                            image = File(taken.path);
                          });
                          // var cropped = await ImageCropper.cropImage(
                          //     sourcePath: image.path,
                          //     aspectRatioPresets: Platform.isAndroid
                          //         ? [
                          //             CropAspectRatioPreset.square,
                          //             CropAspectRatioPreset.ratio3x2,
                          //             CropAspectRatioPreset.original,
                          //             CropAspectRatioPreset.ratio4x3,
                          //             CropAspectRatioPreset.ratio16x9
                          //           ]
                          //         : [
                          //             CropAspectRatioPreset.original,
                          //             CropAspectRatioPreset.square,
                          //             CropAspectRatioPreset.ratio3x2,
                          //             CropAspectRatioPreset.ratio4x3,
                          //             CropAspectRatioPreset.ratio5x3,
                          //             CropAspectRatioPreset.ratio5x4,
                          //             CropAspectRatioPreset.ratio7x5,
                          //             CropAspectRatioPreset.ratio16x9
                          //           ],
                          //     androidUiSettings: AndroidUiSettings(
                          //         toolbarTitle: 'Cropper',
                          //         toolbarColor: Colors.deepOrange,
                          //         toolbarWidgetColor: Colors.black45,
                          //         initAspectRatio:
                          //             CropAspectRatioPreset.original,
                          //         lockAspectRatio: false),
                          //     iosUiSettings: IOSUiSettings(
                          //       title: 'Cropper',
                          //     ));

                          setState(() {
                            images.add(image);
                          });
                        }

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) =>
                        //             ScanDocument()));
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(4278190106)),
                        child: Icon(
                          Icons.camera,
                          color: Color(4278228470),
                          size: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final taken =
                            await picker.getImage(source: ImageSource.gallery);
                        if (taken != null) {
                          setState(() {
                            image = File(taken.path);
                          });
                          // var cropped = await ImageCropper.cropImage(
                          //     sourcePath: image.path,
                          //     aspectRatioPresets: Platform.isAndroid
                          //         ? [
                          //             CropAspectRatioPreset.square,
                          //             CropAspectRatioPreset.ratio3x2,
                          //             CropAspectRatioPreset.original,
                          //             CropAspectRatioPreset.ratio4x3,
                          //             CropAspectRatioPreset.ratio16x9
                          //           ]
                          //         : [
                          //             CropAspectRatioPreset.original,
                          //             CropAspectRatioPreset.square,
                          //             CropAspectRatioPreset.ratio3x2,
                          //             CropAspectRatioPreset.ratio4x3,
                          //             CropAspectRatioPreset.ratio5x3,
                          //             CropAspectRatioPreset.ratio5x4,
                          //             CropAspectRatioPreset.ratio7x5,
                          //             CropAspectRatioPreset.ratio16x9
                          //           ],
                          //     androidUiSettings: AndroidUiSettings(
                          //         toolbarTitle: 'Cropper',
                          //         toolbarColor: Colors.deepOrange,
                          //         toolbarWidgetColor: Colors.black45,
                          //         initAspectRatio:
                          //             CropAspectRatioPreset.original,
                          //         lockAspectRatio: false),
                          //     iosUiSettings: IOSUiSettings(
                          //       title: 'Cropper',
                          //     ));

                          setState(() {
                            images.add(image);
                          });
                        }
                      },
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(4278190106)),
                          child: Icon(
                            Icons.photo,
                            color: Color(4278228470),
                          )),
                    ),
                    GestureDetector(
                      onTap: () async {
                        bool result = await Record().hasPermission();

// Start recording
                        if (result == true) {
                          await Record().start();
                        }
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (ctx) {
                              return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Container(
                                    height: 180,
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
                                          "Recording",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, right: 20),
                                          child: Lottie.network(
                                              "https://assets3.lottiefiles.com/packages/lf20_NKW4Su.json"),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            final path = await Record().stop();
                                            setState(() {
                                              images.add(File(path));
                                            });
                                            Navigator.pop(context);
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
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 17,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            });
                      },
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(4278190106)),
                          child: Icon(
                            Icons.mic,
                            color: Color(4278228470),
                          )),
                    )
                  ],
                ),
              ),
            );
          });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scandoc();
  }

  @override
  void dispose() {
    super.dispose();
    images = [];
  }

  List images = [];
  bool isdialogseen = false;
  final picker = ImagePicker();
  File image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(4293390330),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              image == null
                  ? Container()
                  : Container(
                      height: MediaQuery.of(context).size.height - 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: FileImage(image), fit: BoxFit.cover)),
                    ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  scandoc();
                },
                child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(4279980225)),
                    child: Center(
                        child: Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ))),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  print(images);
                  setState(() {
                    isdialogseen = true;
                  });

                  for (int i = 0; i < images.length; i++) {
                    Dio dio = new Dio();
                    var response =
                        await dio.post("http://143.244.149.151/importImages",
                            data: FormData.fromMap({
                              'file': MultipartFile.fromFileSync(images[i].path,
                                  filename: images[i].toString()),
                            }));
                    print("Classification: " + response.toString());
                    var data = json.decode(response.toString());
                    for (int i = 0; i < (data[0]["questions"]).length; i++) {
                      questions.add(QuestionModel(
                          answer: data[0]["questions"][i]["answers"],
                          question: data[0]["questions"][i]
                              ["question_statement"],
                          options: data[0]["questions"][i]["options"]));
                    }
                    print(questions);
                  }
                  setState(() {
                    isdialogseen = false;
                  });
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => QuizzScreen()));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryBackgroundColor),
                    child: Center(
                        child: Text(
                      "Upload",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ))),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          isdialogseen != true
              ? Container()
              : Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Lottie.network(
                          "https://assets3.lottiefiles.com/packages/lf20_F7WfWB.json",
                          height: 200),
                      Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: Text(
                          "Please Wait....",
                          style:
                              TextStyle(fontSize: 18, color: Color(4283076834)),
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

List<QuestionModel> questions = [];
