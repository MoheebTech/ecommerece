

class OrderModelClass {
  String image;
  String name;
  // Color color;
  int quantity;
  String price;
  int orderNo;
  String status;
  OrderModelClass({
    required this.image,
    required this.name,
    // this.color,
    required this.quantity,
    required this.price,
    required this.orderNo,
    required this.status,
  });
  static List<OrderModelClass> orderClass = [
    OrderModelClass(
        image: 'images/brown1.jpg',
        name: 'Monk Loafers',
        // color: Colors.amber,
        quantity: 1,
        price: '\$299',
        orderNo: 125674,
        status: 'Delivered'),
    OrderModelClass(
        image: 'images/okii.jpg',
        name: 'Suede Loafers',
        // color: 'Colors.green',
        quantity: 1,
        price: '\$199',
        orderNo: 267399,
        status: 'In Progress'),
    OrderModelClass(
        image: 'images/brown3.jpg',
        name: 'Sandals',
        // color: 'Colors.red',
        quantity: 1,
        price: '\$299',
        status: 'Cancelled',
        orderNo: 4646464),
  ];
}
