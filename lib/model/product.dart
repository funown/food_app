class Product {
  final int id;
  final String title;
  final double price;
  final bool isOnSale;
  final double discounts;
  final String shop;
  final String image;
  final String prevImg;
  final int rating;
  final bool isPopular;
  bool isFavorite;
  final List<String> tags;
  final String description;

  Product(
      this.id,
      this.title,
      this.price,
      this.rating,
      this.isPopular,
      this.isFavorite,
      this.tags,
      this.description,
      this.image,
      this.prevImg,
      this.shop,
      this.isOnSale,
      this.discounts);

  Product.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        price = json['price'],
        isOnSale = json['isOnSale'],
        discounts = json['discounts'],
        shop = json['shop'],
        image = json['image'],
        prevImg = json['prevImg'],
        rating = json['rating'],
        isPopular = json['isPopular'],
        isFavorite = json['isFavorite'],
        tags = json['tags'],
        description = json['description'];

  Map toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'isOnSale': isOnSale,
        'discounts': discounts,
        'image': image,
        'shop': shop,
        'prevImg': prevImg,
        'rating': rating,
        'isPopular': isPopular,
        'isFavorite': isFavorite,
        'tags': tags,
        'description': description,
      };
}
