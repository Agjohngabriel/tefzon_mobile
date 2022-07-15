import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tefzon/app/modules/leagues/controllers/league_controller.dart';
import 'package:tefzon/utils/colors.dart';

import '../../../../helpers/dialog_helper.dart';
import '../../../../utils/res.dart';
import '../../../routes/app_pages.dart';

class CreateLeague extends StatefulWidget {
  const CreateLeague({Key? key}) : super(key: key);

  @override
  State<CreateLeague> createState() => _CreateLeagueState();
}

class _CreateLeagueState extends State<CreateLeague> {
  String leagueType = 'private';
  String entryType = 'paid';
  String duration = 'daily';
  String winningType = 'single';
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _amountFocus = FocusNode();
  final FocusNode _patFocus = FocusNode();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _patController = TextEditingController();
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightBlue,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.black,
          ),
          onPressed: () => Get.back(closeOverlays: true),
        ),
        backgroundColor: AppTheme.lightBlue,
        title: Text(
          "Create League",
          style: GoogleFonts.mulish(color: AppTheme.blue),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<LeagueController>(
        builder: (leagueController) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
              children: [
                const Center(
                  child: Text(
                    "Please type carefully and fill out the form with Personal details. You can't edit these details once you submit the form.",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("League Type"),
                          const SizedBox(
                            height: 10,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: DropdownButton(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: "private",
                                    child: Text("Private"),
                                  ),
                                  DropdownMenuItem<String>(
                                      value: "public", child: Text("Public")),
                                ],
                                onChanged: (String? value) {
                                  setState((){
                                    leagueType = value!;
                                  });
                                },
                                value: leagueType,
                                isExpanded: true,
                                underline: const SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Entry Type"),
                          const SizedBox(
                            height: 10,
                          ),
                          DecoratedBox(
                            decoration: const BoxDecoration(color: AppTheme.white),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: DropdownButton(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: "paid",
                                    child: Text("Paid"),
                                  ),
                                  DropdownMenuItem<String>(
                                      value: "free", child: Text("free")),
                                ],
                                value: entryType,
                                onChanged: (String? value) {
                                  setState((){
                                    entryType = value!;
                                  });
                                },
                                isExpanded: true,
                                underline: const SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("League Title"),
                    const SizedBox(
                      height: 10,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        child: TextFormField(
                          controller: _titleController,
                          focusNode: _titleFocus,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Duration"),
                          const SizedBox(
                            height: 10,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: DropdownButton(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: "daily",
                                    child: Text("daily"),
                                  ),
                                  DropdownMenuItem<String>(
                                      value: "weekly", child: Text("weekly")),
                                  DropdownMenuItem<String>(
                                      value: "monthly", child: Text("monthly")),
                                ],
                                value: duration,
                                onChanged: (String? value) {
                                  setState((){
                                    duration = value!;
                                  });
                                },
                                isExpanded: true,
                                underline: const SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Winning Type"),
                          const SizedBox(
                            height: 10,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: DropdownButton(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: "single",
                                    child: Text("Single"),
                                  ),
                                  DropdownMenuItem<String>(
                                      value: "double", child: Text("Double")),
                                  DropdownMenuItem<String>(
                                      value: "triple", child: Text("Triple")),
                                ],
                                value: winningType,
                                onChanged: (String? value) {
                                  setState((){
                                    winningType = value!;
                                  });
                                },
                                isExpanded: true,
                                underline: const SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Participants"),
                    const SizedBox(
                      height: 10,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        child: TextFormField(
                          controller: _patController,
                          focusNode: _patFocus,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Start Date"),
                          const SizedBox(
                            height: 10,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: InputDatePickerFormField(
                                initialDate: selectedStartDate,
                                lastDate: DateTime(2023),
                                firstDate: DateTime.now(),
                                onDateSubmitted: (date) {
                                  setState(() {
                                    selectedStartDate = date;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("End Date"),
                          const SizedBox(
                            height: 10,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: InputDatePickerFormField(
                                initialDate: selectedEndDate,
                                lastDate: DateTime(2023),
                                firstDate: DateTime.now(),
                                onDateSubmitted: (date) {
                                  setState(() {
                                    selectedEndDate = date;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Amount"),
                    const SizedBox(
                      height: 10,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        child: TextFormField(
                          controller: _amountController,
                          focusNode: _amountFocus,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                leagueController.isLoading ? const CircularProgressIndicator() :
                InkWell(
                  onTap:() => _create(leagueController),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: AppTheme.purple.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("Create", style: GoogleFonts.mulish(color: AppTheme.white),)),),
                )
              ],
            ),
          );
        }
      ),
    );
  }
  void _create(LeagueController leagueController){
    String title = _titleController.text.trim();
    String pat = _patController.text.trim();
    String amount = _amountController.text.trim();
      final data = {
        "name" : title,
        "participants": pat,
        "type": leagueType,
        "duration": duration,
        "start" : selectedStartDate.toString(),
        "end" : selectedEndDate.toString(),
        "entry_fee": amount,
        "winner_type": winningType,
        "entry_type": entryType,
      };
      leagueController.createLeague(data).then((status) async {
        if (status.isSuccess) {
          DialogHelper.showDialog(description: status.message, title: "League was Successfully created", onTap: () => Get.offAllNamed(Routes.DASHBOARD));
        } else if (status.statsCode == 422) {
          Get.snackbar("error", status.message, colorText: Colors.red);
        } else if (status.statsCode == 404) {
          DialogHelper.showDialog(description: status.message, onTap: () => Get.back());
      } else if (status.statsCode == 405) {
        DialogHelper.showDialog(description: status.message, title: "An error occured", onTap: () => Get.back());
      }
      });
  }
}


class CustomTextFIeld extends StatelessWidget {
  const CustomTextFIeld({
    Key? key,
    required FocusNode passwordFocus,
    required TextEditingController passwordController,
  })  : _passwordFocus = passwordFocus,
        _passwordController = passwordController,
        super(key: key);

  final FocusNode _passwordFocus;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("League Type"),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          focusNode: _passwordFocus,
          controller: _passwordController,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.grey.withOpacity(0.4)),
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            filled: true,
            fillColor: AppTheme.white,
            // suffixIcon: const Icon(Icons.visibility_off),
            // suffixIconColor: AppTheme.blue,
            hintStyle: GoogleFonts.mulish(
              color: AppTheme.darkText,
              fontSize: width(context, 0.035),
              fontStyle: FontStyle.normal,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
