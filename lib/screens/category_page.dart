import 'package:flutter/material.dart';
import 'package:flutter_news/widgets/news_list_builder.dart';

class CategoryPage extends StatelessWidget {
  final String categoryname;
  const CategoryPage({super.key, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              "Cloud",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            NewsListBuilder(
              category: categoryname,
            )
          ],
        ),
      ),
    );
  }
}
