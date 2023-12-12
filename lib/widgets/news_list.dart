import 'package:flutter/material.dart';
import 'package:flutter_news/models/article_model.dart';

import 'news_card.dart';

class NewsList extends StatelessWidget {
  final List<ArticleModel> articlesData;
  const NewsList({super.key,required this.articlesData});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articlesData.length,
        (context, index) {
          return NewsCard(
            articlemodel: articlesData[index],
          );
        },
      ),
    );
  }
}
