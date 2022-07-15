import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tefzon/controllers/auth_controller.dart';
import '../../../../helpers/dialog_helper.dart';
import '../../../../utils/colors.dart';
import '../../../routes/app_pages.dart';

class AgreementView extends StatefulWidget {
  const AgreementView({Key? key}) : super(key: key);

  @override
  State<AgreementView> createState() => _AgreementViewState();
}

class _AgreementViewState extends State<AgreementView> {
  bool it = false;
  bool its = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                color: AppTheme.blue,
              ),
            ),
            backgroundColor: AppTheme.white,
            title: Text(
              "Subscription & Agreement",
              style: GoogleFonts.mulish(color: AppTheme.blue),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      "Please type carefully and fill out the form with your personal details. You can’t edit these details once you submitted the form."),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Newsletter",
                    style: GoogleFonts.mulish(
                        color: AppTheme.purple,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "This apartment is an inviting choice. Created as a space to spend time in, there's extra room in the open-plan living area, allowing guests to stretch out; whether relaxing on the sofa or enjoying the kitchen. The bedroom and bathroom are also spacious, and continue the sense of warm yet contemporary design, with touches of colour. This apartment is an inviting choice. Created as a space to spend time in, there's extra room in the open-plan living area, allowing guests to stretch out; whether relaxing on the sofa or enjoying the kitchen. "),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(value: it, onChanged: (value){
                        setState((){
                          it = value!;
                        });
                      }),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("I agree to receive football related news")
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Privacy Policy",
                    style: GoogleFonts.mulish(
                        color: AppTheme.purple,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "This apartment is an inviting choice. Created as a space to spend time in, there's extra room in the open-plan living area, allowing guests to stretch out; whether relaxing on the sofa or enjoying the kitchen. The bedroom and bathroom are also spacious, and continue the sense of warm yet contemporary design, with touches of colour. This apartment is an inviting choice. Created as a space to spend time in, there's extra room in the open-plan living area, allowing guests to stretch out; whether relaxing on the sofa or enjoying the kitchen. "),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(value: its, onChanged: (value){
                        setState((){
                          its = value!;
                        });
                      }),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("I agree to receive football related news")
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => _register(Get.find<AuthController>()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                          color: AppTheme.purple,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Center(
                        child: Text(
                          "Register",
                          style: GoogleFonts.mulish(color: AppTheme.white),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
  void _register(AuthController loginController) async {
    loginController.register().then((status) async {
      print(status.statsCode);
      if (status.isSuccess) {
        await Get.find<AuthController>().getProfile();
        Get.offAllNamed(Routes.DASHBOARD);
      } else if (status.statsCode == 422) {
        print("hrloo");
        Get.snackbar("error", status.message, colorText: Colors.red);
      } else if (status.statsCode == 404) {
        DialogHelper.showErrorDialog(description: status.message);
      }
    });
  }
}
