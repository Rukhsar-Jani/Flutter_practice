class Items{

  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Items({ required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image });
}

final products = [
  Items(
    id: "Shaheen001",
    name: "iphone 12 pro",
    desc: "Apple iphone 12th generation",
    price: 999,
    color: "#33505a",
    image:
     "https://images.unsplash.com/photo-1661956602139-ec64991b8b16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw1Nnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60"
  )
];