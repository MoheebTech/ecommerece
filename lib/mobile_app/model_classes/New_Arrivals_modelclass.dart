class NewArrivals {
  String name;
  String image;
  int amount;
  NewArrivals({
    required this.name,
    required this.image,
    required this.amount,
  });
  static List<NewArrivals> newArrivals = [
    NewArrivals(name: 'Monk Straps', image: 'images/brown1.jpg', amount: 299),
    NewArrivals(name: 'Loafers', image: 'images/brown3.jpg', amount: 199),
    NewArrivals(name: 'Suede Loafers', image: 'images/brown2.png', amount: 199),
    NewArrivals(name: 'Monk Straps', image: 'images/brown1.jpg', amount: 299),
    NewArrivals(name: 'Loafers', image: 'images/brown3.jpg', amount: 199),
    NewArrivals(name: 'Suede Loafers', image: 'images/brown2.png', amount: 199),
  ];
  static List<NewArrivals> casualItemList = [
    NewArrivals(
        name: 'Casual', image: 'images/Casual wear/cas1.png', amount: 299),
    NewArrivals(
        name: 'Casual 1', image: 'images/Casual wear/cas2.png', amount: 199),
    NewArrivals(
        name: 'Casual 2', image: 'images/Casual wear/cas3.png', amount: 199),
    NewArrivals(
        name: 'Casual 3', image: 'images/Casual wear/cas4.png', amount: 299),
    NewArrivals(
        name: 'Casual', image: 'images/Casual wear/cas5.png', amount: 299),
  ];
  static List<NewArrivals> bootsItemList = [
    NewArrivals(name: 'Boots', image: 'images/Boots/bo1.png', amount: 299),
    NewArrivals(name: 'Boots 1', image: 'images/Boots/bo2.png', amount: 199),
    NewArrivals(name: 'Boots 2', image: 'images/Boots/bo3.png', amount: 199),
    NewArrivals(name: 'Boots 3', image: 'images/Boots/bo4.png', amount: 299),
    NewArrivals(name: 'Boots 4', image: 'images/Boots/bo5.png', amount: 199),
  ];
  static List<NewArrivals> sneakersItemList = [
    NewArrivals(
        name: 'sneakers ', image: 'images/Sneakers/snkrs1.png', amount: 299),
    NewArrivals(
        name: 'sneakers 1', image: 'images/Sneakers/snkrs2.png', amount: 199),
    NewArrivals(
        name: 'sneakers 2', image: 'images/Sneakers/snkrs3.png', amount: 199),
    NewArrivals(
        name: 'sneakers 3', image: 'images/Sneakers/snkrs4.png', amount: 299),
    NewArrivals(
        name: 'sneakers 4', image: 'images/Sneakers/snkrs5.png', amount: 199),
  ];
  static List<NewArrivals> sandalItemList = [
    NewArrivals(name: 'sandal', image: 'images/sandals/san1.png', amount: 299),
    NewArrivals(
        name: 'sandal 1', image: 'images/sandals/sndls2.png', amount: 199),
    NewArrivals(
        name: 'sandal 2', image: 'images/sandals/san3.png', amount: 199),
    NewArrivals(
        name: 'sandal 3', image: 'images/sandals/san4.png', amount: 299),
    NewArrivals(
        name: 'sandal 4', image: 'images/sandals/sndls5.png', amount: 199),
  ];
}
