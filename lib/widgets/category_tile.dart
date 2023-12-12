import 'package:flutter/material.dart';
import 'package:flutter_news/screens/category_page.dart';

class CategoryTile extends StatelessWidget {
  final String categoryimage;
  final String categorname;
  const CategoryTile(
      {super.key, required this.categoryimage, required this.categorname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CategoryPage(categoryname: categorname);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 130,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(categoryimage),
                fit: BoxFit.cover,
              ),
              color: Colors.black,
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black54,
            ),
            child: Center(
              child: Text(
                categorname,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
