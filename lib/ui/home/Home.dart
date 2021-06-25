import 'package:euroapp_concept/models/PlayerModel.dart';
import 'package:euroapp_concept/ui/players/Player.dart';
import 'package:euroapp_concept/widgets/CustomButton.dart';
import 'package:euroapp_concept/widgets/IconButtonWithImage.dart';
import 'package:euroapp_concept/widgets/PlayerWidget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController? _pageController;
  int selected = 2;
  final List<String> categories = [
    'News',
    'Fixtures',
    'Watchlist',
    'Player Stats'
  ];

  List<PlayerModel> players = [
    PlayerModel(
      name: 'Lewandowski',
      playerImage: 'assets/images/robert-lewandowski.png',
      country: 'Poland',
      isDarkText: false,
      gradientColors: [
        Color(0xFFBA1916),
        Color(0xFF4B0000),
      ],
      playerStats: {
        'Key passes': 0,
        'Assists': 0,
        'Goals': 0,
        'Matches': 0,
      },
      overallStats: 58,
      playerPerformance: {
        'Acceleration': 0,
        'Physical': 0,
        'Passing': 0,
        'Vision': 0,
        'Stamina': 0,
        'Accuracy': 0,
      },
    ),
    PlayerModel(
      name: 'C. Ronaldo',
      playerImage: 'assets/images/cristiano-ronaldo.png',
      country: 'Portugal',
      isDarkText: false,
      gradientColors: [
        Color(0xFF03975E),
        Color(0xFF00442A),
      ],
      playerStats: {
        'Key passes': 60,
        'Assists': 0,
        'Goals': 0,
        'Matches': 0,
      },
      overallStats: 58,
      playerPerformance: {
        'Acceleration': 0,
        'Physical': 0,
        'Passing': 0,
        'Vision': 0,
        'Stamina': 0,
        'Accuracy': 0,
      },
    ),
    PlayerModel(
      name: 'Mason Mount',
      playerImage: 'assets/images/mason-mount.png',
      country: 'England',
      isDarkText: false,
      gradientColors: [
        Color(0xFF1E4FD2),
        Color(0xFF4373B4),
      ],
      playerStats: {
        'Key passes': 80,
        'Assists': 50,
        'Goals': 70,
        'Matches': 90,
      },
      overallStats: 58,
      playerPerformance: {
        'Acceleration': 0,
        'Physical': 0,
        'Passing': 0,
        'Vision': 0,
        'Stamina': 0,
        'Accuracy': 0,
      },
    ),
    PlayerModel(
      name: 'T. Kroos',
      playerImage: 'assets/images/toni-kroos.png',
      country: 'Germany',
      isDarkText: false,
      gradientColors: [
        Color(0xFFBA1916),
        Color(0xFF4B0000),
      ],
      playerStats: {
        'Key passes': 0,
        'Assists': 0,
        'Goals': 0,
        'Matches': 0,
      },
      overallStats: 58,
      playerPerformance: {
        'Acceleration': 0,
        'Physical': 0,
        'Passing': 0,
        'Vision': 0,
        'Stamina': 0,
        'Accuracy': 0,
      },
    ),
    PlayerModel(
      name: 'E. Hazard',
      playerImage: 'assets/images/eden-hazard.png',
      country: 'Belgium',
      isDarkText: true,
      gradientColors: [
        Color(0xFFFFC000),
        Color(0xFFEFCE1F),
      ],
      playerStats: {
        'Key passes': 0,
        'Assists': 0,
        'Goals': 0,
        'Matches': 0,
      },
      overallStats: 58,
      playerPerformance: {
        'Acceleration': 0,
        'Physical': 0,
        'Passing': 0,
        'Vision': 0,
        'Stamina': 0,
        'Accuracy': 0,
      },
    ),
  ];

  _changeSelected(int index) {
    selected = index;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.85);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButtonWithImage(
              onPressed: () {},
              asset: 'assets/images/hamburger.png',
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  categories.length,
                  (index) => InkWell(
                      onTap: () => _changeSelected(index),
                      splashColor: Colors.transparent,
                      child: Column(
                        children: [
                          Text(
                            categories[index],
                            style: TextStyle(
                                fontFamily: 'HK Grotesk',
                                fontWeight: selected == index
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                fontSize: selected == index ? 18 : 14),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 350),
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                                color: selected == index ? Colors.black : null,
                                borderRadius: BorderRadius.circular(40)),
                          )
                        ],
                      ))),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 510,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: players.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return PlayerGradientWidget(
                  pageController: _pageController,
                  player: players[index],
                  index: index,
                );
                // pageController: _pageController,
              },
            ),
          ),
          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return Player(
                        player: players[_pageController!.page!.ceil()]);
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            text: 'View stats',
          )
        ],
      ),
    );
  }
}
