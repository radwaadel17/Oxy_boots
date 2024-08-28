class ItemModel {
  final String txt;
  final String type;
  final double Price;
  final String img;
  final String description ;
  final String img2 ;
  final String img3 ;
 int size;

  ItemModel(
      {required this.Price,
      required this.txt,
      required this.type,
      required this.img ,
      required this.description ,
      required this.img2,
      required this.img3,
      required this.size,
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
        size: 2 ,
        );
  }
  factory ItemModel.fromjsonapi2(json){
  return ItemModel(
  Price: (json['price'] as num).toDouble(), 
  txt: 'Best Choice',
  type: json['category'],
  img: json['image'],
  description: json['description'],
  img2: '',
  img3: '',
  size: 2,
  );
  }
}
