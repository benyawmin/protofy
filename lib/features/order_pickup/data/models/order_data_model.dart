// class StadtSalatModel {
//   List<Product> products;

//   StadtSalatModel({
//     required this.products,
//   });

//   factory StadtSalatModel.fromJson(Map<String, dynamic> json) {
//     return StadtSalatModel(
//       products:
//           List<Product>.from(json['products'].map((x) => Product.fromJson(x))),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'products': List<dynamic>.from(products.map((x) => x.toJson())),
//     };
//   }
// }

// class Product {
//   String name;
//   dynamic byname;
//   dynamic description;
//   dynamic longDescription;
//   dynamic type;
//   dynamic locationBasedPrices;
//   dynamic nutrients;
//   dynamic allergens;
//   String image;
//   Price price;
//   dynamic notes;
//   List<String> tags;
//   List<String> productTags;
//   List<Part> parts;
//   List<dynamic> includes;
//   List<dynamic> addons;
//   bool available;
//   int sorting;
//   ProductDietaryInfo dietaryInfo;
//   dynamic capacity;
//   dynamic foodBusinessOperator;
//   dynamic foodBusinessOperatorAddress;
//   dynamic ingredientList;
//   dynamic containerDepositInCent;
//   String productId;
//   dynamic id;
//   dynamic imageContainer;
//   String unavailabilityInfo;
//   String statisticsFactorLunch;
//   String statisticsFactorEvening;
//   String energyKcal;

//   Product({
//     required this.name,
//     required this.byname,
//     required this.description,
//     required this.longDescription,
//     required this.type,
//     required this.locationBasedPrices,
//     required this.nutrients,
//     required this.allergens,
//     required this.image,
//     required this.price,
//     required this.notes,
//     required this.tags,
//     required this.productTags,
//     required this.parts,
//     required this.includes,
//     required this.addons,
//     required this.available,
//     required this.sorting,
//     required this.dietaryInfo,
//     required this.capacity,
//     required this.foodBusinessOperator,
//     required this.foodBusinessOperatorAddress,
//     required this.ingredientList,
//     required this.containerDepositInCent,
//     required this.productId,
//     required this.id,
//     required this.imageContainer,
//     required this.unavailabilityInfo,
//     required this.statisticsFactorLunch,
//     required this.statisticsFactorEvening,
//     required this.energyKcal,
//   });
//   // From JSON factory method
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       name: json['name'],
//       byname: json['byname'],
//       description: json['description'],
//       longDescription: json['longDescription'],
//       type: json['type'],
//       locationBasedPrices: json['locationBasedPrices'],
//       nutrients: json['nutrients'],
//       allergens: json['allergens'],
//       image: json['image'],
//       price: Price.fromJson(json['price']),
//       notes: json['notes'],
//       tags: List<String>.from(json['tags']),
//       productTags: List<String>.from(json['productTags']),
//       parts: (json['parts'] as List<dynamic>)
//           .map((part) => Part.fromJson(part))
//           .toList(),
//       includes: json['includes'],
//       addons: json['addons'],
//       available: json['available'],
//       sorting: json['sorting'],
//       dietaryInfo: ProductDietaryInfo.fromJson(json['dietaryInfo']),
//       capacity: json['capacity'],
//       foodBusinessOperator: json['foodBusinessOperator'],
//       foodBusinessOperatorAddress: json['foodBusinessOperatorAddress'],
//       ingredientList: json['ingredientList'],
//       containerDepositInCent: json['containerDepositInCent'],
//       productId: json['productId'],
//       id: json['id'],
//       imageContainer: json['imageContainer'],
//       unavailabilityInfo: json['unavailabilityInfo'],
//       statisticsFactorLunch: json['statisticsFactorLunch'],
//       statisticsFactorEvening: json['statisticsFactorEvening'],
//       energyKcal: json['energyKcal'],
//     );
//   }

//   // To JSON method
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'byname': byname,
//       'description': description,
//       'longDescription': longDescription,
//       'type': type,
//       'locationBasedPrices': locationBasedPrices,
//       'nutrients': nutrients,
//       'allergens': allergens,
//       'image': image,
//       'price': price.toJson(),
//       'notes': notes,
//       'tags': tags,
//       'productTags': productTags,
//       'parts': parts.map((part) => part.toJson()).toList(),
//       'includes': includes,
//       'addons': addons,
//       'available': available,
//       'sorting': sorting,
//       'dietaryInfo': dietaryInfo.toJson(),
//       'capacity': capacity,
//       'foodBusinessOperator': foodBusinessOperator,
//       'foodBusinessOperatorAddress': foodBusinessOperatorAddress,
//       'ingredientList': ingredientList,
//       'containerDepositInCent': containerDepositInCent,
//       'productId': productId,
//       'id': id,
//       'imageContainer': imageContainer,
//       'unavailabilityInfo': unavailabilityInfo,
//       'statisticsFactorLunch': statisticsFactorLunch,
//       'statisticsFactorEvening': statisticsFactorEvening,
//       'energyKcal': energyKcal,
//     };
//   }
// }

// class ProductDietaryInfo {
//   List<Allergen> allergens;
//   List<String> tags;
//   Nutrients nutrients;
//   int portionWeight;

//   ProductDietaryInfo({
//     required this.allergens,
//     required this.tags,
//     required this.nutrients,
//     required this.portionWeight,
//   });

//   factory ProductDietaryInfo.fromJson(Map<String, dynamic> json) {
//     return ProductDietaryInfo(
//       allergens: List<Allergen>.from(
//           json['allergens'].map((x) => Allergen.fromJson(x))),
//       tags: List<String>.from(json['tags'].map((x) => x)),
//       nutrients: Nutrients.fromJson(json['nutrients']),
//       portionWeight: json['portionWeight'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'allergens': List<dynamic>.from(allergens.map((x) => x.toJson())),
//       'tags': List<dynamic>.from(tags.map((x) => x)),
//       'nutrients': nutrients.toJson(),
//       'portionWeight': portionWeight,
//     };
//   }
// }

// class Allergen {
//   String id;
//   String name;
//   String examples;

//   Allergen({
//     required this.id,
//     required this.name,
//     required this.examples,
//   });

//   factory Allergen.fromJson(Map<String, dynamic> json) {
//     return Allergen(
//       id: json['id'],
//       name: json['name'],
//       examples: json['examples'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'examples': examples,
//     };
//   }
// }

// class Nutrients {
//   String energyKcal;
//   dynamic kJoule;
//   String fat;
//   String saturatedFattyAcids;
//   String carbohydrates;
//   String sugar;
//   String fibers;
//   String protein;
//   String salt;

//   Nutrients({
//     required this.energyKcal,
//     required this.kJoule,
//     required this.fat,
//     required this.saturatedFattyAcids,
//     required this.carbohydrates,
//     required this.sugar,
//     required this.fibers,
//     required this.protein,
//     required this.salt,
//   });

//   factory Nutrients.fromJson(Map<String, dynamic> json) {
//     return Nutrients(
//       energyKcal: json['energyKcal'],
//       kJoule: json['kJoule'],
//       fat: json['fat'],
//       saturatedFattyAcids: json['saturatedFattyAcids'],
//       carbohydrates: json['carbohydrates'],
//       sugar: json['sugar'],
//       fibers: json['fibers'],
//       protein: json['protein'],
//       salt: json['salt'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'energyKcal': energyKcal,
//       'kJoule': kJoule,
//       'fat': fat,
//       'saturatedFattyAcids': saturatedFattyAcids,
//       'carbohydrates': carbohydrates,
//       'sugar': sugar,
//       'fibers': fibers,
//       'protein': protein,
//       'salt': salt,
//     };
//   }
// }

// class Part {
//   int count;
//   Ingredient ingredient;

//   Part({
//     required this.count,
//     required this.ingredient,
//   });

//   factory Part.fromJson(Map<String, dynamic> json) {
//     return Part(
//       count: json['count'],
//       ingredient: Ingredient.fromJson(json['ingredient']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'count': count,
//       'ingredient': ingredient.toJson(),
//     };
//   }
// }

// class Ingredient {
//   String name;
//   String? description;
//   dynamic longDescription;
//   dynamic nutrients;
//   dynamic allergens;
//   dynamic ingredients;
//   String? image;
//   List<String> tags;
//   bool available;
//   IngredientDietaryInfo dietaryInfo;
//   int shelfLifeDays;
//   dynamic packageSize;
//   int packageCharge;
//   int weightLoss;
//   PackageSizePerStore packageSizePerStore;
//   String ingredientId;
//   Id id;
//   String energyKcalPerUnit;
//   String portionSize;
//   String unit;
//   String statisticsFactorLunch;
//   String statisticsFactorEvening;
//   dynamic cos;

//   Ingredient({
//     required this.name,
//     required this.description,
//     required this.longDescription,
//     required this.nutrients,
//     required this.allergens,
//     required this.ingredients,
//     required this.image,
//     required this.tags,
//     required this.available,
//     required this.dietaryInfo,
//     required this.shelfLifeDays,
//     required this.packageSize,
//     required this.packageCharge,
//     required this.weightLoss,
//     required this.packageSizePerStore,
//     required this.ingredientId,
//     required this.id,
//     required this.energyKcalPerUnit,
//     required this.portionSize,
//     required this.unit,
//     required this.statisticsFactorLunch,
//     required this.statisticsFactorEvening,
//     required this.cos,
//   });

//   factory Ingredient.fromJson(Map<String, dynamic> json) {
//     return Ingredient(
//       name: json['name'],
//       description: json['description'],
//       longDescription: json['longDescription'],
//       nutrients: json['nutrients'],
//       allergens: json['allergens'],
//       ingredients: json['ingredients'],
//       image: json['image'],
//       tags: List<String>.from(json['tags'].map((x) => x)),
//       available: json['available'],
//       dietaryInfo: IngredientDietaryInfo.fromJson(json['dietaryInfo']),
//       shelfLifeDays: json['shelfLifeDays'],
//       packageSize: json['packageSize'],
//       packageCharge: json['packageCharge'],
//       weightLoss: json['weightLoss'],
//       packageSizePerStore:
//           PackageSizePerStore.fromJson(json['packageSizePerStore']),
//       ingredientId: json['ingredientId'],
//       id: Id.fromJson(json['id']),
//       energyKcalPerUnit: json['energyKcalPerUnit'],
//       portionSize: json['portionSize'],
//       unit: json['unit'],
//       statisticsFactorLunch: json['statisticsFactorLunch'],
//       statisticsFactorEvening: json['statisticsFactorEvening'],
//       cos: json['cos'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'description': description,
//       'longDescription': longDescription,
//       'nutrients': nutrients,
//       'allergens': allergens,
//       'ingredients': ingredients,
//       'image': image,
//       'tags': tags,
//       'available': available,
//       'dietaryInfo': dietaryInfo.toJson(),
//       'shelfLifeDays': shelfLifeDays,
//       'packageSize': packageSize,
//       'packageCharge': packageCharge,
//       'weightLoss': weightLoss,
//       'packageSizePerStore': packageSizePerStore.toJson(),
//       'ingredientId': ingredientId,
//       'id': id.toJson(),
//       'energyKcalPerUnit': energyKcalPerUnit,
//       'portionSize': portionSize,
//       'unit': unit,
//       'statisticsFactorLunch': statisticsFactorLunch,
//       'statisticsFactorEvening': statisticsFactorEvening,
//       'cos': cos,
//     };
//   }
// }

// class IngredientDietaryInfo {
//   List<String> allergens;
//   List<String> tags;
//   Nutrients nutrients;
//   int portionWeight;
//   bool nutrientsOverridden;

//   IngredientDietaryInfo({
//     required this.allergens,
//     required this.tags,
//     required this.nutrients,
//     required this.portionWeight,
//     required this.nutrientsOverridden,
//   });

//   factory IngredientDietaryInfo.fromJson(Map<String, dynamic> json) {
//     return IngredientDietaryInfo(
//       allergens: List<String>.from(json['allergens'].map((x) => x)),
//       tags: List<String>.from(json['tags'].map((x) => x)),
//       nutrients: Nutrients.fromJson(json['nutrients']),
//       portionWeight: json['portionWeight'],
//       nutrientsOverridden: json['nutrientsOverridden'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'allergens': allergens,
//       'tags': tags,
//       'nutrients': nutrients.toJson(),
//       'portionWeight': portionWeight,
//       'nutrientsOverridden': nutrientsOverridden,
//     };
//   }
// }

// class Id {
//   int timestamp;
//   DateTime date;

//   Id({
//     required this.timestamp,
//     required this.date,
//   });

//   factory Id.fromJson(Map<String, dynamic> json) {
//     return Id(
//       timestamp: json['timestamp'],
//       date: DateTime.parse(json['date']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'timestamp': timestamp,
//       'date': date.toIso8601String(),
//     };
//   }
// }

// class PackageSizePerStore {
//   PackageSizePerStore();

//   factory PackageSizePerStore.fromJson(Map<String, dynamic> json) {
//     return PackageSizePerStore();
//   }

//   Map<String, dynamic> toJson() {
//     return {};
//   }
// }

// class Price {
//   String withVat;
//   String withoutVat;
//   String vat;
//   String vatAmount;

//   Price({
//     required this.withVat,
//     required this.withoutVat,
//     required this.vat,
//     required this.vatAmount,
//   });

//   factory Price.fromJson(Map<String, dynamic> json) {
//     return Price(
//       withVat: json['withVat'],
//       withoutVat: json['withoutVat'],
//       vat: json['vat'],
//       vatAmount: json['vatAmount'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'withVat': withVat,
//       'withoutVat': withoutVat,
//       'vat': vat,
//       'vatAmount': vatAmount,
//     };
//   }
// }
