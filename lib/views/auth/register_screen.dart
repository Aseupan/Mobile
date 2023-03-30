import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/auth/auth_controller.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  bool _obscureConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();
  final AuthController _controller = Get.find<AuthController>();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: ColorConstants.gradient['blue2'],
          ),
          constraints: BoxConstraints(minHeight: 110.h),
          width: 100.w,
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
                      SizedBox(height: 80),
                      Center(
                        child: Image(
                          image: AssetImage('assets/logo/logo-no-text.png'),
                          width: 116,
                          height: 90,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Hey, welcome!",
                        style: h1TextStyle(
                          color: Colors.white,
                          weight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 30),
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
                          TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 11, horizontal: 14),
                              hintText: "ex: John Doe",
                              hintStyle: body5TextStyle(
                                weight: FontWeight.w600,
                                color: ColorConstants.slate[400],
                              ),
                              filled: true,
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.white,
                            ),
                            controller: _controller.registerForm['name'],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }

                              return null;
                            },
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
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "example@gmail.com",
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
                            controller: _controller.registerForm['email'],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Email';
                              }
                              if (!EmailValidator.validate(value)) {
                                return "Email is not valid";
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
                              hintText: "Password",
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
                            controller: _controller.registerForm['password'],
                            obscureText: _obscureText,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }

                              return null;
                            },
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
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Password",
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
                                icon: _obscureConfirmPassword
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword;
                                  });
                                },
                              ),
                            ),
                            controller: confirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value !=
                                  _controller.registerForm['password']!.text) {
                                return "Your Confirm Password is Wrong";
                              }

                              return null;
                            },
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
                                _controller.register();
                              }
                            },
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
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
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
