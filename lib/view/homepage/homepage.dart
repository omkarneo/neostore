import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/staticdata.dart';
import '../../viewmodel/dashboard/dashboardprovider.dart';

class HomePage extends StatefulWidget {
  final controller;

  const HomePage({super.key, this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Duration duration = const Duration(milliseconds: 300);

  final List<String> imgList = [
    'https://media.istockphoto.com/id/968086564/photo/wooden-chairs-at-table-in-bright-open-space-interior-with-lamp-next-to-grey-couch-real-photo.jpg?s=612x612&w=0&k=20&c=TfE8sZbX_XC4yIYEaRAJHrdIWjZqvRx3Crn0ygcr-h0=',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: duration,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      elevation: 10,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(color: colorPrimaryText),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Consumer(
                builder: (context, ref, child) => AppBar(
                  centerTitle: true,
                  backgroundColor: colorPrimary,
                  shadowColor: Colors.transparent,
                  title: const Text("NeoSTORE"),
                  leading: IconButton(
                    icon: (ref.watch(dashboardpro).isCollapsed)
                        ? const Icon(Icons.menu)
                        : const Icon(Icons.arrow_back_ios_new_sharp),
                    onPressed: () {
                      ref.read(dashboardpro).Collapsed(widget.controller);
                    },
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.search_rounded))
                  ],
                ),
              ),
              FlutterCarousel(
                options: CarouselOptions(
                  height: 250.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  controller: CarouselController(),
                  // onPageChanged: callbackFunction,
                  pageSnapping: true,
                  scrollDirection: Axis.horizontal,
                  pauseAutoPlayOnTouch: true,
                  pauseAutoPlayOnManualNavigate: true,
                  pauseAutoPlayInFiniteScroll: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  disableCenter: false,
                  showIndicator: true,
                  // floatingIndicator = true,
                  slideIndicator: CircularSlideIndicator(),
                ),
                items: imgList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width + 100,
                        // width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(i))),
                      );
                    },
                  );
                }).toList(),
              )
            ]),
          )),
    );
  }
}

gettoken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs.getString("Token"));
}
