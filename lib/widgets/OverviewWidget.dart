import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OverviewWidget extends StatefulWidget {
  OverviewWidget({Key? key, required this.property, required this.value})
      : super(key: key);

  final String? property;
  final int? value;
  @override
  _OverviewWidgetState createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.property!,
                style: TextStyle(
                    fontFamily: 'HK Grotesk',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF11102E)),
              ),
              Text(
                '${widget.value!}',
                style: TextStyle(
                    fontFamily: 'HK Grotesk',
                    fontWeight: FontWeight.w900,
                    fontSize: 19,
                    color: Color(0xFF11102E)),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            padding: const EdgeInsets.only(left: 3),
            animation: true,
            lineHeight: 6.5,
            animationDuration: 800,
            percent: widget.value! / 100,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Color(0xFF11102E),
            backgroundColor: Color(0xFFF3F3F9),
          ),
        ],
      ),
    );
  }
}
