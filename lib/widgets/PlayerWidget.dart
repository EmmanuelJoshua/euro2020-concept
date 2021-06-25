import 'package:euroapp_concept/models/PlayerModel.dart';
import 'package:flutter/material.dart';

class PlayerGradientWidget extends StatefulWidget {
  PlayerGradientWidget({
    Key? key,
    required PageController? pageController,
    required this.player,
    required this.index,
  })   : _pageController = pageController,
        super(key: key);

  final PageController? _pageController;
  final int index;
  final PlayerModel player;
  @override
  _PlayerGradientWidgetState createState() => _PlayerGradientWidgetState();
}

class _PlayerGradientWidgetState extends State<PlayerGradientWidget> {
  @override
  Widget build(BuildContext context) {
    final Color textColor =
        widget.player.isDarkText! ? Colors.black : Colors.white;
    return AnimatedBuilder(
        animation: widget._pageController!,
        builder: (BuildContext context, Widget? widget) {
          double value = 1;
          if (super.widget._pageController!.position.haveDimensions) {
            value = super.widget._pageController!.page! - super.widget.index;
            value = (1 - (value.abs() * 0.4) + 0.01).clamp(0.0, 1.0);
          }
          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(value) * 600,
              width: Curves.easeInOut.transform(value) * 550,
              child: widget,
            ),
          );
        },
        child: Center(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 25.00),
          decoration: BoxDecoration(
            color: Color(0xFF232B3E),
            gradient: LinearGradient(
                colors: [...widget.player.gradientColors!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.player.name!,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                          color: textColor),
                    ),
                    Text(
                      widget.player.country!,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 19,
                          color: textColor),
                    )
                  ],
                ),
              ),
              Spacer(),
              Expanded(
                flex: 15,
                child: Image.asset(
                  widget.player.playerImage!,
                  alignment: Alignment.centerRight,
                  // height: 370,
                ),
              )
            ],
          ),
        )));
  }
}
