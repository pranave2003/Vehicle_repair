import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Premiumpage extends StatefulWidget {
  const Premiumpage({super.key});

  @override
  State<Premiumpage> createState() => _PremiumpageState();
}

class _PremiumpageState extends State<Premiumpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Column(children: [
        Text(
          "Get Premium",
          style: GoogleFonts.poppins(fontSize: 30, color: Colors.white),
        ),
        Text(
          "Get All The New Exciting Features",
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.amber),
        ),
        Lottie.asset('assets/Animation - 1715334676747.json',
            height: 100, width: 100, fit: BoxFit.fill),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white38, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: 480.h,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Benefits",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                ),
              ),
              Divider(
                color: Colors.amber,
                endIndent: 50,
                indent: 50,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 20.w, bottom: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 200,
                          child: Text(
                            "Premium videos",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
              //
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 200,
                          child: Text(
                            "Live class",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
              //
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 200.w,
                          child: Text(
                            "Mentoring",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
              //
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 200.w,
                          child: Text(
                            "Job Assistance",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
              //
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 200.w,
                          child: Text(
                            "Free Bootcamp",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 200.w,
                          child: Text(
                            "Interview Training",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
              //
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 250.w,
                          child: Text(
                            "Financial Assistance",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
              //

              //
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 200.w,
                          child: Text(
                            "Whatsapp Support",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
              //

              //
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 200.w,
                          child: Text(
                            "Startup support",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      print("Done");
                    },
                    child: Container(
                      height: 50.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "BUY NOW/",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "\$399",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      )),
                    ),
                  )
                ],
              )
            ]),
          ),
        )
      ]),
    );
  }
}
