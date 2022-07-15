import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tefzon/utils/colors.dart';

class SelectSquad extends StatefulWidget {
  const SelectSquad({Key? key}) : super(key: key);

  @override
  State<SelectSquad> createState() => _SelectSquadState();
}

class _SelectSquadState extends State<SelectSquad> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          appBar: AppBar(
            title: const Text("Squad"),
            elevation: 0,
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      height: 80,
                      decoration: const BoxDecoration(color: AppTheme.white),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Final Points",
                              style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "62",
                              style: GoogleFonts.mulish(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: AppTheme.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Average Pts",
                                style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w700, fontSize: 13),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "61",
                                style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Average Pts",
                                style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w700, fontSize: 13),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "164",
                                style: GoogleFonts.mulish(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: AppTheme.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Average Pts",
                                style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w700, fontSize: 13),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "61",
                                style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Average Pts",
                                style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.w700, fontSize: 13),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "164",
                                style: GoogleFonts.mulish(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: const Text("Bench boast"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: const Text("Free Hit"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: const Text("Tripple Captain"),
                  ),
                ],),
                SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('asset/images/pitch.png'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppTheme.primary,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
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
                                  prefixIcon: Icon(Icons.search)
                                ),
                              ),
                            ),
                          ),
                        ),
                          SizedBox(width: 10,),
                          Container(
                            child: const Text("Reset"),
                          )
                      ],),
                      const SizedBox(height: 13,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SquadPositionFetch(title: "ALL",),
                          SquadPositionFetch(title: "GK",),
                          SquadPositionFetch(title: "DEF",),
                          SquadPositionFetch(title: "MID",),
                          SquadPositionFetch(title: "FWD",),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class SquadPositionFetch extends StatelessWidget {
  final String title;
  const SquadPositionFetch({
    Key? key, required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Text(title),
    );
  }
}
