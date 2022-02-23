class Content {
  String username;
  int categoryId;
  String category;
  int views;
  int favds;
  int comments;
  String? title;
  String? description;
  bool? isVerified;

  Content(
      {required this.username,
      required this.categoryId,
      required this.category,
      required this.views,
      required this.favds,
      required this.comments,
      this.title,
      this.description,
      this.isVerified});

  static List<Content> contentSampleList = [

    new Content(
      username: "PewDiePie",
      categoryId: 4,
      category: "Fortnite",
      title: "Fortnite with Ninja??",
      views: 68503,
      favds: 21562,
      comments: 454,
      isVerified: true,
    ),
    new Content(
      username: "POW2Rtv",
      categoryId: 3,
      category: "Warzone",
      title: "Daje",
      views: 5285,
      favds: 456,
      comments: 804,
      isVerified: true,
    ),
    new Content(
      username: "XzY_86",
      categoryId: 6,
      category: "Rust",
      title: "Pazzi scatenati su Rust!",
      description: "youtube.com/kjsdfkj",
      views: 15,
      favds: 4,
      comments: 13,
      isVerified: false,
    ),
    new Content(
      username: "Eddy Burback",
      categoryId: 3,
      category: "Warzone",
      title: "Codz Broz",
      description: "Tony and I goofing around as usual",
      views: 3253,
      favds: 2907,
      comments: 120,
      isVerified: true,
    ),
    new Content(
      username: "Hell4Fr3sh",
      categoryId: 4,
      category: "Fortnite",
      title: "Yo wassup",
      views: 11,
      favds: 0,
      comments: 1,
      isVerified: false,
    )
  ];
}
