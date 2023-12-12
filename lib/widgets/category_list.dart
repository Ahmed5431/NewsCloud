import 'package:flutter/material.dart';
import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/widgets/category_tile.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories = [
    CategoryModel(name: "Technology", image: "assets/technology.jpg"),
    CategoryModel(name: "Business", image: "assets/business.jpg"),
    CategoryModel(name: "Science", image: "assets/science.jpg"),
    CategoryModel(name: "Sports", image: "assets/sports.jpeg"),
  ];
  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryTile(
                categoryimage: categories[index].image,
                categorname: categories[index].name);
          }),
    );
  }
}
