// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_matcher/screens/profile_screen.dart';

import 'home_screen.dart';

class MainTabsScreen extends StatefulWidget {
  const MainTabsScreen({Key? key}) : super(key: key);

  @override
  _MainTabsScreenState createState() => _MainTabsScreenState();
}

class _MainTabsScreenState extends State<MainTabsScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(color: Color(0xFF3E2C3A)),
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  _tabController.animateTo(index);
                },
                scrollDirection: Axis.horizontal,
                children: [
                  HomeScreen(),
                  ProfileScreen(),
                ],
              ),
              Positioned(
                bottom: 20,
                left: constraints.maxWidth / 2 - 20,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TabPageSelector(
                    controller: _tabController,
                    selectedColor: Color(0xFFF2F2F3),
                  ),
                ),
              )
            ],
          ),
        );
      });
    });
  }
}
