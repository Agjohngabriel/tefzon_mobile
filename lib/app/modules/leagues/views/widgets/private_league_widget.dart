import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../helpers/dialog_helper.dart';
import '../../../../../utils/colors.dart';
import '../../../../data/models/league_model.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/league_controller.dart';

class PrivateLeagues extends StatelessWidget {
  const PrivateLeagues({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Join league by code"
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                TextButton(onPressed: (){}, child: Text("Join", style: GoogleFonts.mulish(color: AppTheme.purple),))
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Text("List of Live leagues", style: GoogleFonts.mulish(fontWeight: FontWeight.w700),),
          const SizedBox(height: 20,),
          FutureBuilder<List<LeagueModel>>(
            future: Get.find<LeagueController>().fetchPrivate(),
            builder: (context,AsyncSnapshot snapshot) {
             if(snapshot.hasData){
               return SizedBox(
                 height: 200,
                 child: ListView(
                   children: [
                     ...snapshot.data!.map<Widget>((e) => Container(
                       margin: const EdgeInsets.all(10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           FittedBox(child: Text('${e.name}')),
                           Text('${e.entryType}'),
                           const Text("12 August 2022"),
                           TextButton(onPressed: () => _joinPrivate(code: e.code, id: e.id) , child: Text("Join League", style: GoogleFonts.mulish(color: AppTheme.purple),)),
                         ],
                       ),
                     ))
                   ],
                 ),
               );
             }else if(snapshot.hasError){
               return Text('${snapshot.error}');
             }
             return const Center(child: CircularProgressIndicator());
            }
          ),
        ],
      ),
    );
  }
  void _joinPrivate({required int id,required String code}){
    final data = {
      "id": id,
      "code": code
    };
    Get.find<LeagueController>().joinPrivateLeague(data).then((status) async {
      if (status.isSuccess) {
        DialogHelper.showDialog(description: status.message, title: "You've successfully joined league", onTap: () => Get.offAllNamed(Routes.DASHBOARD));
      } else if (status.statsCode == 422) {
        Get.snackbar(status.message.toUpperCase(),"An error occured", colorText: AppTheme.blue);
      } else if (status.statsCode == 404) {
        DialogHelper.showDialog(description: status.message, onTap: () => Get.back());
      } else if (status.statsCode == 405) {
        DialogHelper.showDialog(description: status.message, title: "An error occured", onTap: () => Get.back());
      }
    });
  }
}