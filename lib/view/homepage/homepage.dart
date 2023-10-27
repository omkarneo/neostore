// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/view/homepage/widget/chairs.dart';
import 'package:neostore/view/homepage/widget/cupboardbox.dart';
import 'package:neostore/view/homepage/widget/sofasbox.dart';
import 'package:neostore/view/homepage/widget/tablebox.dart';

import '../../core/utils/staticdata.dart';
import '../../viewmodel/dashboard/dashboardprovider.dart';
import '../../viewmodel/product/productspro.dart';

class HomePage extends StatefulWidget {
  final controller;

  const HomePage({super.key, this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = ["assets/images/3.jpeg", "assets/images/4.jpeg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryText,
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
              ref.read(dashboardpro).collapsed(widget.controller);
            },
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
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
            Consumer(
              builder: (context, ref, child) => Expanded(
                flex: 3,
                child: AbsorbPointer(
                  absorbing: !ref.watch(dashboardpro).isCollapsed,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  child: const TableBox(),
                                  onTap: () {
                                    ref
                                        .read(productprovider)
                                        .fetchproducts("1");
                                    Navigator.pushNamed(
                                        context, RoutePaths.productlist,
                                        arguments: "1");
                                  },
                                ),
                                InkWell(
                                  child: const ChairsBox(),
                                  onTap: () {
                                    ref
                                        .read(productprovider)
                                        .fetchproducts("2");
                                    Navigator.pushNamed(
                                        context, RoutePaths.productlist,
                                        arguments: "2");
                                  },
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  child: const SofasBox(),
                                  onTap: () {
                                    ref
                                        .read(productprovider)
                                        .fetchproducts("3");
                                    Navigator.pushNamed(
                                        context, RoutePaths.productlist,
                                        arguments: "3");
                                  },
                                ),
                                InkWell(
                                  child: const CupBoardBox(),
                                  onTap: () {
                                    ref
                                        .read(productprovider)
                                        .fetchproducts("5");
                                    Navigator.pushNamed(
                                        context, RoutePaths.productlist,
                                        arguments: "5");
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
