class FoodCategory {
  final String category;
  final int numOfItem;
  final String image;

  FoodCategory(this.category, this.numOfItem, this.image);

  FoodCategory.fromJson(Map json)
      : category = json["category"],
        numOfItem = json["numOfItem"],
        image = json["image"];

  Map toJson() => {
        "category": category,
        "numOfItem": numOfItem,
        "image": image,
      };
}
