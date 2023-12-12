import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/services/news_service.dart';
import 'package:flutter_news/widgets/slider_tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int activeindex = 0;
  dynamic future;
  @override
  void initState() {
    super.initState();
    future = NewsService().getSliderNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CarouselSlider.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index, realIndex) {
                    return SliderTile(
                        image: snapshot.data![index].image!,
                        title: snapshot.data![index].title!,
                        url: snapshot.data![index].url!,);
                  },
                  options: CarouselOptions(
                      height: 250,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeindex = index;
                        });
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedSmoothIndicator(
                    activeIndex: activeindex, count: snapshot.data!.length)
              ],
            );
          } else if (snapshot.hasError) {
            return const Text("An Unexpected Error Happened");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
