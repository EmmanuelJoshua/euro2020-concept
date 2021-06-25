import 'package:euroapp_concept/models/PlayerModel.dart';
import 'package:euroapp_concept/widgets/IconButtonWithImage.dart';
import 'package:euroapp_concept/widgets/OverviewWidget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Player extends StatefulWidget {
  Player({Key? key, required this.player}) : super(key: key);

  final PlayerModel? player;
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    final Color textColor =
        widget.player!.isDarkText! ? Colors.black : Colors.white;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: widget.player!.isDarkText! ? Colors.black : Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.34,
            padding: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
              color: Color(0xFF232B3E),
              gradient: LinearGradient(
                  colors: [...widget.player!.gradientColors!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.player!.name!,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                            color: textColor),
                      ),
                      Text(
                        widget.player!.country!,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 19,
                            color: textColor),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  // flex: 15,
                  child: Image.asset(
                    widget.player!.playerImage!,
                    alignment: Alignment.centerRight,
                  ),
                )
              ],
            ),
          ),
          //TODO:draggable sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'OVERVIEW',
                          style: TextStyle(
                              fontFamily: 'HK Grotesk',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF11102E),
                              fontSize: 24),
                        ),
                        IconButtonWithImage(
                          onPressed: () {},
                          asset: 'assets/images/menu.png',
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: Column(
                            children: [
                              for (var key
                                  in widget.player!.playerStats!.keys) ...[
                                OverviewWidget(
                                  property: key,
                                  value: widget.player!.playerStats![key],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ]
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Overall',
                                  style: TextStyle(
                                      fontFamily: 'HK Grotesk',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF11102E),
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CircularPercentIndicator(
                                  progressColor: Color(0xFF11102E),
                                  backgroundColor: Color(0xFFF3F3F9),
                                  radius: 120.0,
                                  lineWidth: 10.0,
                                  animation: true,
                                  animationDuration: 800,
                                  percent: widget.player!.overallStats! / 100,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  center: Text(
                                    "${widget.player!.overallStats}",
                                    style: TextStyle(
                                        fontFamily: 'HK Grotesk',
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF11102E),
                                        fontSize: 30),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.11,
            minChildSize: 0.1,
            maxChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xFF11102E),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ListView(
                  controller: scrollController,
                  physics: FixedExtentScrollPhysics(),
                  padding: const EdgeInsets.only(top: 30),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 4,
                          decoration: BoxDecoration(
                              color: Color(0xFFCFCFFF),
                              borderRadius: BorderRadius.circular(5)),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
