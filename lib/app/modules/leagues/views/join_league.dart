import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:tefzon/app/modules/leagues/views/widgets/private_league_widget.dart';
import 'package:tefzon/app/modules/leagues/views/widgets/public_league_widgets.dart';

import '../../../../utils/colors.dart';

class JoinLeague extends StatelessWidget {
  final int index;
  const JoinLeague({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(backgroundColor: AppTheme.lightBlue,
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
          "Join League",
          style: GoogleFonts.mulish(color: AppTheme.blue),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          const Center(child: Text("Choose a league type to join",
          textAlign: TextAlign.center,)),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search League"
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16.5),
                  decoration: BoxDecoration(
                    color: AppTheme.purple,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text("Search", style: GoogleFonts.mulish(color: AppTheme.white),),
                ),
              ],
            ),
          ),
          DefaultTabController(
            initialIndex: index,
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelStyle:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  unselectedLabelStyle:
                  context.textTheme.caption?.copyWith(fontSize: 14),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  indicator: const UnderlineTabIndicator(
                    // color: AppColors.white,
                    borderSide: BorderSide(width: 3, color: AppTheme.purple),
                    insets: EdgeInsets.only(
                      right: 150,
                      left: 10,
                    ),
                  ),
                  labelColor: AppTheme.purple,
                  indicatorColor: AppTheme.purple,
                  unselectedLabelColor: AppTheme.black,
                  tabs: const [
                      Tab(
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Public League",
                            maxLines: 2,
                          ),
                        ),
                      ),
                    Tab(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Private League",
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 450,
                  child: TabBarView(
                    children: [
                        PublicLeagues(),
                      PrivateLeagues(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),

    ));
  }
}

