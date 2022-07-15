import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tefzon/app/modules/get_started/views/login_view.dart';
import 'package:tefzon/controllers/auth_controller.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/res.dart';
import '../../../routes/app_pages.dart';

class SignupView extends GetView {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppTheme.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
            child: GetBuilder<AuthController>(
              builder: (controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height(context, 0.08),
                    ),
                    Text(
                      "Sign up to start your journey",
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
                    CustomFormField(
                      controller: controller.firstnameController,
                      type: TextInputType.name,
                      text: "First Name",
                    ),
                    SizedBox(
                      height: height(context, 0.015),
                    ),
                    CustomFormField(
                      controller: controller.lastNameController,
                      type: TextInputType.name,
                      text: "Last Name",
                    ),
                    SizedBox(
                      height: height(context, 0.015),
                    ),
                    CustomFormField(
                      controller: controller.emailController,
                      type: TextInputType.emailAddress,
                      text: "Email Address",
                    ),
                    SizedBox(
                      height: height(context, 0.015),
                    ),
                    CustomFormField(
                      controller: controller.userNameController,
                      type: TextInputType.name,
                      text: "Username",
                    ),
                    SizedBox(
                      height: height(context, 0.015),
                    ),
                    CustomFormField(
                      controller: controller.passwordController,
                      type: TextInputType.visiblePassword,
                      text: "Choose Password",
                    ),
                    SizedBox(
                      height: height(context, 0.015),
                    ),
                    CustomFormField(
                      controller: controller.phoneController,
                      type: TextInputType.phone,
                      text: "Phone Number",
                    ),
                    SizedBox(
                      height: height(context, 0.015),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormField(
                            controller: controller.dobController,
                            type: TextInputType.datetime,
                            text: "Date of birth",
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Expanded(
                          child: CustomFormField(
                            controller: controller.genderController,
                            type: TextInputType.name,
                            text: "gender",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                    InkWell(
                        onTap: () => Get.toNamed(Routes.FAVOURITE),
                        child: const CustomContainer()),
                    SizedBox(
                      height: height(context, 0.02),
                    ),
                    InkWell(
                      onTap: () => Get.to(LoginView()),
                      child: Text(
                        "Already have an account? Login",
                        style: GoogleFonts.montserrat(
                            color: AppTheme.blue,
                            letterSpacing: 0.4,
                            fontSize: width(
                              context,
                              0.04,
                            ),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
          color: AppTheme.purple,
          borderRadius: BorderRadius.all(Radius.circular(9))),
      child: Center(
          child: Text(
        "Proceed",
        style: GoogleFonts.mulish(
          color: AppTheme.white,
          fontSize: 18,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w700,
        ),
      )),
    );
  }
}

class CustomFormField extends StatelessWidget {
  String text;
  TextEditingController controller;
  TextInputType type;
  CustomFormField({Key? key, required this.text, required this.controller, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        filled: true,
        fillColor: AppTheme.primary.withOpacity(0.6),
        hintText: text,
        hintStyle: GoogleFonts.mulish(
          color: AppTheme.blue.withOpacity(0.8),
          fontSize: width(context, 0.04),
          fontStyle: FontStyle.normal,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
