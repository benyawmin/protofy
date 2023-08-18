class StadtSalatModel {
  final List<Product> products;

  StadtSalatModel({
    required this.products,
  });

  StadtSalatModel copyWith({
    List<Product>? products,
  }) =>
      StadtSalatModel(
        products: products ?? this.products,
      );

  factory StadtSalatModel.fromJson(Map<String, dynamic> json) {
    return StadtSalatModel(
      products: (json['products'] as List)
          .map((productJson) => Product.fromJson(productJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}

class Product {
  final String name;
  final String description;
  final String image;
  final Price price;
  final List<String> tags;

  Product({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.tags,
  });

  Product copyWith({
    String? name,
    String? description,
    String? image,
    Price? price,
    List<String>? tags,
  }) =>
      Product(
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        price: price ?? this.price,
        tags: tags ?? this.tags,
      );
// product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] != null
          ? Price.fromJson(json['price'])
          : Price(vat: '0', vatAmount: '0', withVat: '0', withoutVat: '0'),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((tag) => tag.toString())
              .toList() ??
          [],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'price': price.toJson(),
      'tags': tags,
    };
  }
}

class Price {
  final String withVat;
  final String withoutVat;
  final String vat;
  final String vatAmount;

  Price({
    required this.withVat,
    required this.withoutVat,
    required this.vat,
    required this.vatAmount,
  });

  Price copyWith({
    String? withVat,
    String? withoutVat,
    String? vat,
    String? vatAmount,
  }) =>
      Price(
        withVat: withVat ?? this.withVat,
        withoutVat: withoutVat ?? this.withoutVat,
        vat: vat ?? this.vat,
        vatAmount: vatAmount ?? this.vatAmount,
      );

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      withVat: json['withVat'],
      withoutVat: json['withoutVat'],
      vat: json['vat'],
      vatAmount: json['vatAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'withVat': withVat,
      'withoutVat': withoutVat,
      'vat': vat,
      'vatAmount': vatAmount,
    };
  }
}
