import 'package:food_app/model/product.dart';

class Shop {
  final int id;
  final String title;
  final String image;
  final int rating;
  final List<Product> products;
  final List<String> rewards;
  final List<String> categories;
  final String location;

  Shop(this.id, this.title, this.image, this.rating, this.products,
      this.rewards, this.categories, this.location);

  Shop.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        image = json['image'],
        rating = json['rating'],
        products = json['products'],
        rewards = json['rewards'],
        categories = json['categories'],
        location = json['location'];

  Map toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'rating': rating,
        'products': products,
        'rewards': rewards,
        'categories': categories,
        'location': location,
      };
}
