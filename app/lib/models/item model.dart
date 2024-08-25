class ItemModel {
  final String txt;
  final String type;
  final double Price;
  final String img;
  final String description ;
  final String img2 ;
  final String img3 ;

  const ItemModel(
      {required this.Price,
      required this.txt,
      required this.type,
      required this.img ,
      required this.description ,
      required this.img2,
      required this.img3,
      });
  factory ItemModel.fromjson(json) {
    return ItemModel(
        Price: json['price'],
        txt: 'Best Seller',
        type: json['brand'],
        img: json['images'][0],
        img2: json['images'][1],
        img3: json['images'][2],
        description: json['description'],
        );
  }
  factory ItemModel.fromjsonapi2(json){
  return ItemModel(
  Price: json['price'], 
  txt: 'Best Choice',
  type: json['title'],
  img: json['images'][0],
  description: json['description'],
  img2: '',
  img3: '',
  );
  }
}
