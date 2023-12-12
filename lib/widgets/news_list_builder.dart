import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../services/news_service.dart';
import 'news_list.dart';

class NewsListBuilder extends StatefulWidget {
  final String category;
  const NewsListBuilder({
    super.key, required this.category,
  });

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  dynamic future;
  @override
  void initState() {
    super.initState();
    future = NewsService().getGeneralNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsList(articlesData: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(child: Text("Error"));
          } else {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
