import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/view/homepage/widget/chairs.dart';
import 'package:neostore/view/homepage/widget/cupboardbox.dart';
import 'package:neostore/view/homepage/widget/sofasbox.dart';
import 'package:neostore/view/homepage/widget/tablebox.dart';

import '../../core/utils/staticdata.dart';
import '../../viewmodel/dashboard/dashboardprovider.dart';

class HomePage extends StatefulWidget {
  final controller;

  const HomePage({super.key, this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    "assets/images/1.avif",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg"
  ];
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorPrimary,
        shadowColor: Colors.transparent,
        title: const Text("NeoSTORE"),
        leading: Consumer(
          builder: (context, ref, child) => IconButton(
            icon: (ref.watch(dashboardpro).isCollapsed)
                ? const Icon(Icons.menu)
                : const Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () {
              ref.read(dashboardpro).Collapsed(widget.controller);
            },
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height / 1.2,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: FlutterCarousel(
                options: CarouselOptions(
                  height: 500,
                  viewportFraction: 1.05,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  controller: CarouselController(),
                  pageSnapping: true,
                  scrollDirection: Axis.horizontal,
                  pauseAutoPlayOnTouch: true,
                  pauseAutoPlayOnManualNavigate: true,
                  pauseAutoPlayInFiniteScroll: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  disableCenter: false,
                  showIndicator: true,
                  // slideIndicator: CircularSlideIndicator(),
                ),
                items: imgList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(i), fit: BoxFit.fill)),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            child: TableBox(),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutePaths.productlist);
                            },
                          ),
                          ChairsBox()
                        ],
                      ),
                      Column(
                        children: [SofasBox(), CupBoardBox()],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
