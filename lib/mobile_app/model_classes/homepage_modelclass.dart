class HomePageModelClass {
  String images;
  String name;
  int amount;
  int count;
  int totalPrice;
  late bool checkValue;

  HomePageModelClass(
      {required this.images,
      required this.name,
      required this.amount,
      required this.count,
      required this.totalPrice});
  static List<HomePageModelClass> homePageModelClass = [
    HomePageModelClass(
        images: 'images/brown1.jpg',
        name: 'Monk Straps',
        amount: 299,
        count: 1,
        totalPrice: 45),
    HomePageModelClass(
        images: 'images/okii.jpg',
        name: 'Tassel loafers',
        amount: 199,
        count: 1,
        totalPrice: 78),
    HomePageModelClass(
        images: 'images/brown1.jpg',
        name: 'School shoe',
        amount: 99,
        count: 1,
        totalPrice: 789),
    HomePageModelClass(
        images: 'images/brown1.jpg',
        name: 'Monk Straps',
        amount: 299,
        count: 1,
        totalPrice: 455),
    HomePageModelClass(
        images: 'images/okii.jpg',
        name: 'Tassel loafers',
        amount: 199,
        count: 1,
        totalPrice: 887),
    HomePageModelClass(
        images: 'images/brown1.jpg',
        name: 'School shoe',
        amount: 99,
        count: 1,
        totalPrice: 545),
  ];
}

class ResponseModelClass {
  int index;
  bool isPresent;
  ResponseModelClass({required this.index, required this.isPresent});
}
