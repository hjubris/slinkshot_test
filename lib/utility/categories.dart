import 'package:flutter/cupertino.dart';

class Categories {
  String name;
  int categoryId;

  Categories({
    required this.name,
    required this.categoryId,
  });

  static List<Categories> categoryList = [
    new Categories(name: "All", categoryId: 0),
    new Categories(name: "Followed", categoryId: 1),
    new Categories(name: "Pac-Man", categoryId: 2),
    new Categories(name: "Warzone", categoryId: 3),
    new Categories(name: "Fortnite", categoryId: 4),
    new Categories(name: "Rust", categoryId: 5),
    new Categories(name: "Apex Legends", categoryId: 6),
  ];
}
