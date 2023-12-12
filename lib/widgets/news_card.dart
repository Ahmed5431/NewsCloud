import 'package:flutter/material.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/screens/web_view_page.dart';

class NewsCard extends StatelessWidget {
  final ArticleModel articlemodel;
  const NewsCard({super.key, required this.articlemodel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return WebViewPage(
            url: articlemodel.url!,
          );
        }));
      },
      child: Material(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  articlemodel.image ??
                      "https://static.vecteezy.com/system/resources/thumbnails/004/216/831/original/3d-world-news-background-loop-free-video.jpg",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
            const SizedBox(height: 10),
            Text(
              articlemodel.title ?? "No Title",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(
              articlemodel.description ?? "No Description",
              maxLines: 2,
              style: const TextStyle(color: Colors.grey),
            )
          ]),
        ),
      ),
    );
  }
}
