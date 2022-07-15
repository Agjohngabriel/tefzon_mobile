import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tefzon/app/modules/get_started/views/signup_view.dart';
import 'package:tefzon/utils/colors.dart';

import '../../../../controllers/auth_controller.dart';
import '../../../../helpers/dialog_helper.dart';
import '../../../../utils/res.dart';
import '../../../routes/app_pages.dart';
import '../controllers/get_started_controller.dart';

class LoginView extends StatelessWidget {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppTheme.white,
        appBar: AppBar(
          backgroundColor: AppTheme.white,
          title: Image(
            image: const AssetImage("asset/images/logo.png"),
            width: width(context, 0.45),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: GetBuilder<AuthController>(builder: (loginController) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in to get started",
                      style: GoogleFonts.montserrat(
                          color: AppTheme.blue,
                          letterSpacing: 0.4,
                          fontSize: width(
                            context,
                            0.04,
                          ),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                    SizedBox(
                      child: TextFormField(
                        focusNode: _emailFocus,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(6))),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(6))),
                          filled: true,
                          fillColor: AppTheme.primary.withOpacity(0.6),
                          hintText: 'Enter Email Address',
                          hintStyle: GoogleFonts.mulish(
                            color: AppTheme.blue.withOpacity(0.8),
                            fontSize: width(context, 0.04),
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                    SizedBox(
                      child: TextFormField(
                        focusNode: _passwordFocus,
                        controller: _passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(6))),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(6))),
                          filled: true,
                          fillColor: AppTheme.primary.withOpacity(0.6),
                          hintText: 'Enter Password',
                          hintStyle: GoogleFonts.mulish(
                            color: AppTheme.blue.withOpacity(0.8),
                            fontSize: width(context, 0.04),
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                    const Align(alignment: Alignment.centerRight, child: Text("Forgot password?")),
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                    loginController.isLoading ? CircularProgressIndicator() :
                    InkWell(
                      onTap: () {
                        _login(loginController);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: const BoxDecoration(
                            color: AppTheme.blue,
                            borderRadius: BorderRadius.all(Radius.circular(9))),
                        child: Center(
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.mulish(
                                color: AppTheme.white,
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: height(context, 0.02),
                    ),
                    InkWell(
                      onTap: () => Get.to(SignupView()),
                      child: Text("Create Account",style: GoogleFonts.montserrat(
                          color: AppTheme.blue,
                          letterSpacing: 0.4,
                          fontSize: width(
                            context,
                            0.04,
                          ),
                          fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: height(context, 0.05),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: height(context, 0.001),
                          width: width(context, 0.3),
                          decoration: const BoxDecoration(
                              color: AppTheme.blue,
                              borderRadius:
                              BorderRadius.all(Radius.circular(6))),
                        ),
                        const SizedBox(
                          width: 19,
                        ),
                        Center(
                          child: Text(
                            'Or',
                            style: GoogleFonts.mulish(
                              color: AppTheme.blue,
                              fontSize: width(context, 0.04),
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 19,
                        ),
                        Container(
                          height: height(context, 0.001),
                          width: width(context, 0.3),
                          // width: MediaQuery.of(context).size.width / 2.6,
                          decoration: const BoxDecoration(
                              color: AppTheme.blue,
                              borderRadius:
                              BorderRadius.all(Radius.circular(6))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context, 0.04),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(9))),
                      child: Row(
                        children: [
                          Image(image: const AssetImage("asset/images/fb.png"), width: width(context, 0.08),),
                          const SizedBox(width: 20,),
                          Text(
                            "Sign in with Facebook",
                            style: GoogleFonts.mulish(
                              color: AppTheme.white,
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height(context, 0.025),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppTheme.white,
                          border: Border.all(color: AppTheme.blue),
                          borderRadius: const BorderRadius.all(Radius.circular(9))),
                      child: Row(
                        children: [
                          Image(image: const AssetImage("asset/images/google.png"), width: width(context, 0.08),),
                          const SizedBox(width: 20,),
                          Text(
                            "Sign in with Google",
                            style: GoogleFonts.mulish(
                              color: AppTheme.blue,
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height(context, 0.025),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
  void _login(AuthController loginController) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    loginController.login(email, password).then((status) async {
      if (status.isSuccess) {
        await Get.find<AuthController>().getProfile();
        Get.offAllNamed(Routes.DASHBOARD);
      } else if (status.statsCode == 422) {
        Get.snackbar("error", status.message, colorText: Colors.red);
      } else if (status.statsCode == 404) {
        DialogHelper.showErrorDialog(description: status.message);
      }
    });
  }

}
