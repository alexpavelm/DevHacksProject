class Category {
  String title;
  int minutes;
  int money;
  double rating;
  String imagePath;

  Category({
    this.title = '',
    this.imagePath = '',
    this.minutes = 0,
    this.money = 0,
    this.rating = 0.0,
  });

  static List<Category> categoryList = [
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Stocks',
      minutes: 15,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Bonds',
      minutes: 15,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Mutual Funds',
      minutes: 30,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Index Funds',
      minutes: 25,
      money: 18,
      rating: 4.6,
    ),
  ];

  static List<Category> popularCourseList = [
    Category(
      imagePath: 'assets/images/interFace3.png',
      title: 'Uses of crowdfunding',
      minutes: 10,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/images/interFace4.png',
      title: 'Financial advisors',
      minutes: 20,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/images/interFace3.png',
      title: 'Stocks',
      minutes: 15,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/images/interFace4.png',
      title: 'Staying ahead of the market',
      minutes: 30,
      money: 208,
      rating: 4.9,
    ),
  ];
}
