import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tefzon/utils/colors.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppTheme.nearlyWhite,
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TopNav(
                  title: "My Squad",
                ),
                TopNav(title: "Fixtures"),
                TopNav(title: "Transfer"),
                TopNav(title: "Prices"),
                TopNav(title: "Profile"),
                TopNav(title: "Fixtures"),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: const BoxDecoration(
                color: AppTheme.lightBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                HeadingItems(title: "Fixtures",),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: const Center(
                      child: Text("Gameweek 20 - Tue 26 Jan 17:30"),
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    color: AppTheme.grey,
                    child: const Center(
                      child: Text("Tuesday 26 January 2022"),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const FixtureGameWidget(),
                const Divider(
                  thickness: 1,
                  color: AppTheme.grey,
                ),
                const FixtureGameWidget(),
                const Divider(
                  thickness: 1,
                  color: AppTheme.grey,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    color: AppTheme.grey,
                    child: const Center(
                      child: Text("Wednesday 22 January 2022"),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const FixtureGameWidget(),
                const Divider(
                  thickness: 1,
                  color: AppTheme.grey,
                ),
                const FixtureGameWidget(),
                const Divider(
                  thickness: 1,
                  color: AppTheme.grey,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
                color: AppTheme.lightBlue,
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppTheme.white, AppTheme.lightBlue]),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Entry History",
                  style: GoogleFonts.mulish(
                      color: AppTheme.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "This Season",
                  style: GoogleFonts.mulish(
                      color: AppTheme.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Table(
                  columnWidths: const {
                    0: FractionColumnWidth(.15),
                    1: FractionColumnWidth(.10),
                    2: FractionColumnWidth(.10),
                    3: FractionColumnWidth(.20),
                    4: FractionColumnWidth(.10),
                    5: FractionColumnWidth(.07),
                    6: FractionColumnWidth(.07),
                    7: FractionColumnWidth(.15),
                    8: FractionColumnWidth(.05),
                    9: FractionColumnWidth(.05),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    const TableRow(
                      decoration: BoxDecoration(color: AppTheme.grey),
                      children: <Widget>[
                        Text("GW"),
                        Text("GP"),
                        Text("PB"),
                        Text("GR"),
                        Text("TM"),
                        Text("TC"),
                        Text("OP"),
                        Text("OR"),
                        Text("@"),
                        Text("#")
                      ],
                    ),
                    buildTableRow(),
                    buildTableRow(),
                    buildTableRow(),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
                color: AppTheme.lightBlue,
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppTheme.white, AppTheme.lightBlue]),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [HeadingItems(title: "League 1842965")],
            ),
          )
        ],
      ),
    ));
  }

  TableRow buildTableRow() {
    return const TableRow(
      children: <Widget>[
        Text("GW24"),
        Text("62"),
        Text("5"),
        Text("3,934,456"),
        Text("0"),
        Text("0"),
        Text("0"),
        Text("0"),
        Text("0"),
        Icon(
          Icons.arrow_drop_down,
          color: AppTheme.red,
        )
      ],
    );
  }
}

class HeadingItems extends StatelessWidget {
  String title;
  HeadingItems({
    Key? key, required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Row(
            children: const [
              Text("See all"),
              Icon(Icons.arrow_forward)
            ],
          ),
        ],
      ),
    );
  }
}

class FixtureGameWidget extends StatelessWidget {
  const FixtureGameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
            width: 100, child: Center(child: Text("Crystal Palace"))),
        Row(
          children: [
            const Image(
                image: NetworkImage(
                    "https://cdn.sportmonks.com/images/soccer/teams/30/62.png",
                    scale: 4)),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppTheme.grey)),
              child: const Text("17:30"),
            ),
            const SizedBox(
              width: 10,
            ),
            const Image(
                image: NetworkImage(
                    "https://cdn.sportmonks.com/images/soccer/teams/22/246.png",
                    scale: 4)),
          ],
        ),
        const SizedBox(width: 100, child: Center(child: Text("West Ham"))),
      ],
    );
  }
}

class TopNav extends StatelessWidget {
  String title;
  TopNav({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: 90,
      height: 30,
      decoration: BoxDecoration(
          color: AppTheme.white, borderRadius: BorderRadius.circular(15)),
      child: Center(child: Text(title)),
    );
  }
}
