import 'package:untitled/12_05/tangible_asset.dart';

class Book extends TangibleAsset{
  String name;
  int price;
  String color;
  String isbn;

  Book({
    required this.name,
    required this.price,
    required this.color,
    required this.isbn,
  });

  @override
  void saveAsset() {
    // TODO: implement manageAsset
    super.tangibleAssets.add(this);
  }

  @override
  void allAssetList() {
    for (TangibleAsset tangibleAssets in super.tangibleAssets) {
      print(tangibleAssets);
    }
  }

  @override
  String toString() {
    return 'Book{name: $name, price: $price, color: $color, isbn: $isbn}';
  }
}