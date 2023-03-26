import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/auth/auth_controller.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/services/api/app_token.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  final AuthController _controller = Get.find<AuthController>();

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
              Form(
                key: _formKey,
                child: Padding(
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
                        "Glad to see\nyou come back!",
                        style: h1TextStyle(
                          color: Colors.white,
                          weight: FontWeight.w800,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: bodyTextStyle(
                              weight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.email,
                                color: ColorConstants.slate[500],
                              ),
                            ),
                            controller: _controller.loginForm["email"],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
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
                          TextFormField(
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }

                              return null;
                            },
                            obscureText: _obscureText,
                            controller: _controller.loginForm.value['password'],
                          ),
                          SizedBox(height: 15),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 40),
                              backgroundColor: Colors.white,
                              foregroundColor: ColorConstants.primary[300],
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _controller.login();
                              }
                            },
                            child: Text(
                              "Login",
                              style: h5TextStyle(
                                color: ColorConstants.primary[500],
                                weight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Doesn't have an account? ",
                                style: h5TextStyle(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: "Register",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // ROUTES GO TO REGISTER
                                        Get.offAndToNamed(RoutePage.register);
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
