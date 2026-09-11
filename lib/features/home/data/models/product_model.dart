
import 'dart:convert';

import 'package:mini_shop/core/assets_manager/assets_manager.dart';

enum ProductCategoryEnum {
  mensClothing(categoryName: "men's clothing"),
  jewelery(categoryName: 'jewelery'),
  electronics(categoryName: 'electronics'),
  womensClothing(categoryName: "women's clothing");

  const ProductCategoryEnum({required this.categoryName});

  final String categoryName;
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.isFavorite = false,
  });

  final int id;
  final String title;
  final num price;
  final String description;
  final ProductCategoryEnum category;
  final String image;
  final RatingModel rating;
  final bool isFavorite;

  static final List<ProductModel> products = [
    ProductModel(
      id: 1,
      title: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
      price: 109.95,
      description: 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
      category: ProductCategoryEnum.mensClothing,
      image: AssetsManager.imagesProductsBags,
      rating: RatingModel(rate: 3.9, count: 120),
    ),
    ProductModel(
      id: 2,
      title: 'Mens Casual Premium Slim Fit T-Shirts',
      price: 22.3,
      description: 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing.',
      category: ProductCategoryEnum.mensClothing,
      image: AssetsManager.imagesProductsClothes,
      rating: RatingModel(rate: 4.1, count: 259),
    ),
    ProductModel(
      id: 3,
      title: 'Mens Cotton Jacket',
      price: 55.99,
      description: 'Great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain climbing, cycling and traveling.',
      category: ProductCategoryEnum.mensClothing,
      image: AssetsManager.imagesProductsClothes2,
      rating: RatingModel(rate: 4.7, count: 500),
    ),
    ProductModel(
      id: 4,
      title: 'Mens Casual Slim Fit',
      price: 15.99,
      description: 'The color could be slightly different between on the screen and in practice. Please note that body builds vary by person.',
      category: ProductCategoryEnum.mensClothing,
      image: AssetsManager.imagesProductsClothes3,
      rating: RatingModel(rate: 2.1, count: 430),
    ),
    ProductModel(
      id: 5,
      title: "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
      price: 695,
      description: "From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl.",
      category: ProductCategoryEnum.jewelery,
      image: AssetsManager.imagesProductsJewerly,
      rating: RatingModel(rate: 4.6, count: 400),
    ),
    ProductModel(
      id: 6,
      title: 'Solid Gold Petite Micropave',
      price: 168,
      description: 'Satisfaction Guaranteed. Return or exchange any order within 30 days. Designed and sold by Hafeez Center in the United States.',
      category: ProductCategoryEnum.jewelery,
      image: AssetsManager.imagesProductsJewerly2,
      rating: RatingModel(rate: 3.9, count: 70),
    ),
    ProductModel(
      id: 7,
      title: 'White Gold Plated Princess',
      price: 9.99,
      description: 'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary and Valentine’s Day.',
      category: ProductCategoryEnum.jewelery,
      image: AssetsManager.imagesProductsRings,
      rating: RatingModel(rate: 3, count: 400),
    ),
    ProductModel(
      id: 8,
      title: 'Pierced Owl Rose Gold Plated Stainless Steel Double',
      price: 10.99,
      description: 'Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel.',
      category: ProductCategoryEnum.jewelery,
      image: AssetsManager.imagesProductsRoseGoldJewerly,
      rating: RatingModel(rate: 1.9, count: 100),
    ),
    ProductModel(
      id: 9,
      title: 'WD 2TB Elements Portable External Hard Drive - USB 3.0',
      price: 64,
      description: 'USB 3.0 and USB 2.0 Compatibility. Fast data transfers. Improve PC Performance. High Capacity.',
      category: ProductCategoryEnum.electronics,
      image: AssetsManager.imagesProductsHardDiskElectronics,
      rating: RatingModel(rate: 3.3, count: 203),
    ),
    ProductModel(
      id: 10,
      title: 'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s',
      price: 109,
      description: 'Easy upgrade for faster boot up, shutdown, application load and response. Read/write speeds of up to 535MB/s.',
      category: ProductCategoryEnum.electronics,
      image: AssetsManager.imagesProductsSsd,
      rating: RatingModel(rate: 2.9, count: 470),
    ),
    ProductModel(
      id: 11,
      title: 'Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5',
      price: 109,
      description: '3D NAND flash delivers high transfer speeds. Advanced SLC Cache Technology provides performance boost and longer lifespan.',
      category: ProductCategoryEnum.electronics,
      image: AssetsManager.imagesProductsSsd2,
      rating: RatingModel(rate: 4.8, count: 319),
    ),
    ProductModel(
      id: 12,
      title: 'WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive',
      price: 114,
      description: 'Expand your PS4 gaming experience. Play anywhere. Fast and easy setup with sleek design and high capacity.',
      category: ProductCategoryEnum.electronics,
      image: AssetsManager.imagesProductsHardDisk3,
      rating: RatingModel(rate: 4.8, count: 400),
    ),
    ProductModel(
      id: 13,
      title: 'Acer SB220Q bi 21.5 inches Full HD IPS Ultra-Thin',
      price: 599,
      description: '21.5 inches Full HD widescreen IPS display with Radeon FreeSync technology, 75Hz refresh rate and 4ms response time.',
      category: ProductCategoryEnum.electronics,
      image: AssetsManager.imagesProductsMonitor,
      rating: RatingModel(rate: 2.9, count: 250),
    ),
    ProductModel(
      id: 14,
      title: 'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor',
      price: 999.99,
      description: '49 inch super ultrawide 32:9 curved gaming monitor with QLED technology, HDR support, 144Hz refresh rate and 1ms response time.',
      category: ProductCategoryEnum.electronics,
      image: AssetsManager.imagesProductsMonitor2,
      rating: RatingModel(rate: 2.2, count: 140),
    ),
    ProductModel(
      id: 15,
      title: "BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats",
      price: 56.99,
      description: 'The jackets are US standard size. Material: 100% Polyester with detachable warm fleece liner. Suitable for different seasons and climates.',
      category: ProductCategoryEnum.womensClothing,
      image: AssetsManager.imagesProductsWomanShirt2,
      rating: RatingModel(rate: 2.6, count: 235),
    ),
    ProductModel(
      id: 16,
      title: "Lock and Love Women's Removable Hooded Faux Leather Moto Biker Jacket",
      price: 29.95,
      description: '100% polyurethane shell with polyester lining. Faux leather material for style and comfort with front pockets and hooded design.',
      category: ProductCategoryEnum.womensClothing,
      image: AssetsManager.imagesProductsWomanShirt3,
      rating: RatingModel(rate: 2.9, count: 340),
    ),
    ProductModel(
      id: 17,
      title: 'Rain Jacket Women Windbreaker Striped Climbing Raincoats',
      price: 39.99,
      description: 'Lightweight raincoat perfect for trips or casual wear. Long sleeve with hood, adjustable drawstring waist and button and zipper closure.',
      category: ProductCategoryEnum.womensClothing,
      image: AssetsManager.imagesProductsWomanShirt4,
      rating: RatingModel(rate: 3.8, count: 679),
    ),
    ProductModel(
      id: 18,
      title: "MBJ Women's Solid Short Sleeve Boat Neck V",
      price: 9.85,
      description: '95% Rayon and 5% Spandex. Lightweight fabric with great stretch for comfort. Ribbed sleeves and neckline.',
      category: ProductCategoryEnum.womensClothing,
      image: AssetsManager.imagesProductsWomanShirt5,
      rating: RatingModel(rate: 4.7, count: 130),
    ),
    ProductModel(
      id: 19,
      title: "Opna Women's Short Sleeve Moisture",
      price: 7.95,
      description: '100% Polyester lightweight fabric with moisture-wicking properties. Comfortable V-neck collar and slimmer fit.',
      category: ProductCategoryEnum.womensClothing,
      image: AssetsManager.imagesProductsWomanShirt6,
      rating: RatingModel(rate: 4.5, count: 146),
    ),
    ProductModel(
      id: 20,
      title: "DANVOUY Womens T Shirt Casual Cotton Short",
      price: 12.99,
      description: '95% Cotton and 5% Spandex. Casual short sleeve V-neck fashion tee with soft and slightly stretchy fabric.',
      category: ProductCategoryEnum.womensClothing,
      image: AssetsManager.imagesProductsShirt,
      rating: RatingModel(rate: 3.6, count: 145),
    ),
  ];

  ProductModel copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    ProductCategoryEnum? category,
    String? image,
    RatingModel? rating,
    bool? isFavorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category.name,
      'image': image,
      'rating': rating.toMap(),
      'isFavorite': isFavorite,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      description: map['description'] as String,
      category: ProductCategoryEnum.values.byName(map['category'] as String),
      image: map['image'] as String,
      rating: RatingModel.fromMap(map['rating'] as Map<String, dynamic>),
      isFavorite: map['isFavorite'] as bool? ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) {
    return ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() {
    return 'ProductModel('
        'id: $id, '
        'title: $title, '
        'price: $price, '
        'description: $description, '
        'category: $category, '
        'image: $image, '
        'rating: $rating, '
        'isFavorite: $isFavorite'
        ')';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.description == description &&
        other.category == category &&
        other.image == image &&
        other.rating == rating &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        description.hashCode ^
        category.hashCode ^
        image.hashCode ^
        rating.hashCode ^
        isFavorite.hashCode;
  }
}

class RatingModel {
  RatingModel({required this.rate, required this.count});

  final num rate;
  final int count;

  Map<String, dynamic> toMap() {
    return {'rate': rate, 'count': count};
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(rate: map['rate'] as num, count: map['count'] as int);
  }

  @override
  String toString() {
    return 'RatingModel(rate: $rate, count: $count)';
  }

  @override
  bool operator ==(covariant RatingModel other) {
    if (identical(this, other)) {
      return true;
    }

    return other.rate == rate && other.count == count;
  }

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;
}
