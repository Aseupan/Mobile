import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_contant.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: ColorConstants.gradient['blue2'],
          ),
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              Image(
                image: AssetImage("assets/images/login.png"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Center(
                      child: SvgPicture.asset("assets/images/logo.svg"),
                    ),
                    Text(
                      "Hey, welcome!",
                      style: h1TextStyle(
                        color: Colors.white,
                        weight: FontWeight.w800,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: bodyTextStyle(
                            weight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Email",
                          style: bodyTextStyle(
                            weight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: ColorConstants.slate[500],
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Password",
                          style: bodyTextStyle(
                            weight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: ColorConstants.slate[500],
                            ),
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscureText,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Confirm Password",
                          style: bodyTextStyle(
                            weight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: ColorConstants.slate[500],
                            ),
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscureText,
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                            backgroundColor: Colors.white,
                            foregroundColor: ColorConstants.primary[300],
                          ),
                          onPressed: () {},
                          child: Text(
                            "Register",
                            style: h5TextStyle(
                              color: ColorConstants.primary[300],
                              weight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: h5TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed(RoutePage.login);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
