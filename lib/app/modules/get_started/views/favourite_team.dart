import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:tefzon/app/data/models/favourite.dart';
import 'package:tefzon/app/modules/get_started/controllers/get_started_controller.dart';
import 'package:tefzon/controllers/auth_controller.dart';
import 'package:tefzon/utils/colors.dart';

import '../../../../utils/res.dart';
import '../../../routes/app_pages.dart';

class SelectFavourite extends StatefulWidget {
  const SelectFavourite({Key? key}) : super(key: key);

  @override
  State<SelectFavourite> createState() => _SelectFavouriteState();
}

class _SelectFavouriteState extends State<SelectFavourite> {
  _loadData() {
    Get.find<AuthController>().readJson();
  }

  @override
  Widget build(BuildContext context) {
    _loadData();
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: AppTheme.blue,
              ),
            ),
            backgroundColor: AppTheme.white,
            title: Text(
              "Your Favourite",
              style: GoogleFonts.mulish(color: AppTheme.blue),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GetBuilder<AuthController>(builder: (controller) {
              return Column(
                children: [
                  const Text(
                      "Please type carefully and fill out the form with your personal details. You can’t edit these details once you submitted the form."),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder<List<Favourite>>(
                      future: controller.readJson(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return SizedBox(
                            height: height(context, 0.75),
                            width: 400,
                            child: GridView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 3 / 5,
                                ),
                                children: [
                                  ...snapshot.data!.map<Widget>((e) => Stack(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  "${e.logoPath}",
                                                  scale: 3,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "${e.name}",
                                                  overflow: TextOverflow.clip,
                                                )
                                              ],
                                            ),
                                          ),
                                          const Positioned(
                                              right: 0,
                                              top: 0,
                                              child: Checkbox(
                                                  value: false,
                                                  onChanged: null))
                                        ],
                                      ))
                                ]),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.TERMS),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                          color: AppTheme.purple,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Center(
                        child: Text(
                          "Proceed",
                          style: GoogleFonts.mulish(color: AppTheme.white),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ));
  }
}
