class ItemModel {
  final String txt;
  final String type;
  final String Price;
  final String img;
  const ItemModel(
      {required this.Price,
      required this.txt,
      required this.type,
      required this.img});
  factory ItemModel.fromjson(json) {
    return ItemModel(
        Price: json['price'],
        txt: 'Best Seller',
        type: json['brand'],
        img: json['images'][0]);
  }
}
