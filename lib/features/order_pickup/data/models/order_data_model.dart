class StadtSalatModel {
  StadtSalatModel({
    required this.id,
    required this.name,
    required this.active,
    required this.position,
    required this.products,
    required this.deliveryPrice,
    required this.freeDeliveryThreshold,
    required this.estimatedDeliveryDuration,
    required this.estimatedDeliveryDurationDistance,
    required this.estimatedDeliveryDurationIncrement,
    required this.estimatedDeliveryDurationIncrementDistance,
    required this.address,
    required this.images,
    required this.paymentMethods,
    required this.deliveryTypes,
    required this.reusablePackagingEnabled,
    required this.businessDay,
    required this.nextBusinessDays,
    required this.deliveryGroup,
    required this.alert,
  });
  late final String id;
  late final String name;
  late final bool active;
  late final Position position;
  late final List<Products> products;
  late final DeliveryPrice deliveryPrice;
  late final String freeDeliveryThreshold;
  late final String estimatedDeliveryDuration;
  late final int estimatedDeliveryDurationDistance;
  late final String estimatedDeliveryDurationIncrement;
  late final int estimatedDeliveryDurationIncrementDistance;
  late final Address address;
  late final Images images;
  late final List<String> paymentMethods;
  late final List<String> deliveryTypes;
  late final bool reusablePackagingEnabled;
  late final BusinessDay businessDay;
  late final List<NextBusinessDays> nextBusinessDays;
  late final String deliveryGroup;
  late final Alert alert;
  
  StadtSalatModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    active = json['active'];
    position = Position.fromJson(json['position']);
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
    deliveryPrice = DeliveryPrice.fromJson(json['deliveryPrice']);
    freeDeliveryThreshold = json['freeDeliveryThreshold'];
    estimatedDeliveryDuration = json['estimatedDeliveryDuration'];
    estimatedDeliveryDurationDistance = json['estimatedDeliveryDurationDistance'];
    estimatedDeliveryDurationIncrement = json['estimatedDeliveryDurationIncrement'];
    estimatedDeliveryDurationIncrementDistance = json['estimatedDeliveryDurationIncrementDistance'];
    address = Address.fromJson(json['address']);
    images = Images.fromJson(json['images']);
    paymentMethods = List.castFrom<dynamic, String>(json['paymentMethods']);
    deliveryTypes = List.castFrom<dynamic, String>(json['deliveryTypes']);
    reusablePackagingEnabled = json['reusablePackagingEnabled'];
    businessDay = BusinessDay.fromJson(json['businessDay']);
    nextBusinessDays = List.from(json['nextBusinessDays']).map((e)=>NextBusinessDays.fromJson(e)).toList();
    deliveryGroup = json['deliveryGroup'];
    alert = Alert.fromJson(json['alert']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['active'] = active;
    _data['position'] = position.toJson();
    _data['products'] = products.map((e)=>e.toJson()).toList();
    _data['deliveryPrice'] = deliveryPrice.toJson();
    _data['freeDeliveryThreshold'] = freeDeliveryThreshold;
    _data['estimatedDeliveryDuration'] = estimatedDeliveryDuration;
    _data['estimatedDeliveryDurationDistance'] = estimatedDeliveryDurationDistance;
    _data['estimatedDeliveryDurationIncrement'] = estimatedDeliveryDurationIncrement;
    _data['estimatedDeliveryDurationIncrementDistance'] = estimatedDeliveryDurationIncrementDistance;
    _data['address'] = address.toJson();
    _data['images'] = images.toJson();
    _data['paymentMethods'] = paymentMethods;
    _data['deliveryTypes'] = deliveryTypes;
    _data['reusablePackagingEnabled'] = reusablePackagingEnabled;
    _data['businessDay'] = businessDay.toJson();
    _data['nextBusinessDays'] = nextBusinessDays.map((e)=>e.toJson()).toList();
    _data['deliveryGroup'] = deliveryGroup;
    _data['alert'] = alert.toJson();
    return _data;
  }
}

class Position {
  Position({
    required this.longitude,
    required this.latitude,
  });
  late final double longitude;
  late final double latitude;
  
  Position.fromJson(Map<String, dynamic> json){
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    return _data;
  }
}

class Products {
  Products({
    required this.name,
     this.byname,
     this.description,
     this.longDescription,
     this.type,
     this.locationBasedPrices,
     this.nutrients,
     this.allergens,
    required this.image,
    required this.price,
     this.notes,
    required this.tags,
    required this.productTags,
    required this.parts,
    required this.includes,
    required this.addons,
    required this.available,
    required this.sorting,
    required this.dietaryInfo,
     this.capacity,
     this.foodBusinessOperator,
     this.foodBusinessOperatorAddress,
     this.ingredientList,
     this.containerDepositInCent,
    required this.id,
     this.imageContainer,
    required this.unavailabilityInfo,
    required this.statisticsFactorLunch,
    required this.statisticsFactorEvening,
    required this.energyKcal,
  });
  late final String name;
  late final Null byname;
  late final String? description;
  late final String? longDescription;
  late final Null type;
  late final Null locationBasedPrices;
  late final Null nutrients;
  late final Null allergens;
  late final String image;
  late final Price price;
  late final Null notes;
  late final List<String> tags;
  late final List<String> productTags;
  late final List<Parts> parts;
  late final List<Includes> includes;
  late final List<Addons> addons;
  late final bool available;
  late final int sorting;
  late final DietaryInfo dietaryInfo;
  late final Null capacity;
  late final Null foodBusinessOperator;
  late final Null foodBusinessOperatorAddress;
  late final Null ingredientList;
  late final Null containerDepositInCent;
  late final String id;
  late final Null _id;
  late final Null imageContainer;
  late final String unavailabilityInfo;
  late final String statisticsFactorLunch;
  late final String statisticsFactorEvening;
  late final String energyKcal;
  
  Products.fromJson(Map<String, dynamic> json){
    name = json['name'];
    byname = null;
    description = null;
    longDescription = null;
    type = null;
    locationBasedPrices = null;
    nutrients = null;
    allergens = null;
    image = json['image'];
    price = Price.fromJson(json['price']);
    notes = null;
    tags = List.castFrom<dynamic, String>(json['tags']);
    productTags = List.castFrom<dynamic, String>(json['productTags']);
    parts = List.from(json['parts']).map((e)=>Parts.fromJson(e)).toList();
    includes = List.from(json['includes']).map((e)=>Includes.fromJson(e)).toList();
    addons = List.from(json['addons']).map((e)=>Addons.fromJson(e)).toList();
    available = json['available'];
    sorting = json['sorting'];
    dietaryInfo = DietaryInfo.fromJson(json['dietaryInfo']);
    capacity = null;
    foodBusinessOperator = null;
    foodBusinessOperatorAddress = null;
    ingredientList = null;
    containerDepositInCent = null;
    id = json['id'];
    _id = null;
    imageContainer = null;
    unavailabilityInfo = json['unavailabilityInfo'];
    statisticsFactorLunch = json['statisticsFactorLunch'];
    statisticsFactorEvening = json['statisticsFactorEvening'];
    energyKcal = json['energyKcal'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['byname'] = byname;
    _data['description'] = description;
    _data['longDescription'] = longDescription;
    _data['type'] = type;
    _data['locationBasedPrices'] = locationBasedPrices;
    _data['nutrients'] = nutrients;
    _data['allergens'] = allergens;
    _data['image'] = image;
    _data['price'] = price.toJson();
    _data['notes'] = notes;
    _data['tags'] = tags;
    _data['productTags'] = productTags;
    _data['parts'] = parts.map((e)=>e.toJson()).toList();
    _data['includes'] = includes.map((e)=>e.toJson()).toList();
    _data['addons'] = addons.map((e)=>e.toJson()).toList();
    _data['available'] = available;
    _data['sorting'] = sorting;
    _data['dietaryInfo'] = dietaryInfo.toJson();
    _data['capacity'] = capacity;
    _data['foodBusinessOperator'] = foodBusinessOperator;
    _data['foodBusinessOperatorAddress'] = foodBusinessOperatorAddress;
    _data['ingredientList'] = ingredientList;
    _data['containerDepositInCent'] = containerDepositInCent;
    _data['id'] = id;
    _data['_id'] = _id;
    _data['imageContainer'] = imageContainer;
    _data['unavailabilityInfo'] = unavailabilityInfo;
    _data['statisticsFactorLunch'] = statisticsFactorLunch;
    _data['statisticsFactorEvening'] = statisticsFactorEvening;
    _data['energyKcal'] = energyKcal;
    return _data;
  }
}

class Price {
  Price({
    required this.withVat,
    required this.withoutVat,
    required this.vat,
    required this.vatAmount,
  });
  late final String withVat;
  late final String withoutVat;
  late final String vat;
  late final String vatAmount;
  
  Price.fromJson(Map<String, dynamic> json){
    withVat = json['withVat'];
    withoutVat = json['withoutVat'];
    vat = json['vat'];
    vatAmount = json['vatAmount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['withVat'] = withVat;
    _data['withoutVat'] = withoutVat;
    _data['vat'] = vat;
    _data['vatAmount'] = vatAmount;
    return _data;
  }
}

class Parts {
  Parts({
    required this.count,
    required this.ingredient,
  });
  late final int count;
  late final Ingredient ingredient;
  
  Parts.fromJson(Map<String, dynamic> json){
    count = json['count'];
    ingredient = Ingredient.fromJson(json['ingredient']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['ingredient'] = ingredient.toJson();
    return _data;
  }
}

class Ingredient {
  Ingredient({
    required this.name,
     this.description,
     this.longDescription,
     this.nutrients,
     this.allergens,
     this.ingredients,
     this.image,
    required this.tags,
    required this.available,
    required this.dietaryInfo,
    required this.shelfLifeDays,
     this.packageSize,
    required this.packageCharge,
    required this.weightLoss,
    required this.packageSizePerStore,
    required this.id,
    required this.energyKcalPerUnit,
    required this.portionSize,
    required this.unit,
    required this.statisticsFactorLunch,
    required this.statisticsFactorEvening,
     this.cos,
  });
  late final String name;
  late final String? description;
  late final String? longDescription;
  late final Null nutrients;
  late final Null allergens;
  late final Null ingredients;
  late final String? image;
  late final List<String> tags;
  late final bool available;
  late final DietaryInfo dietaryInfo;
  late final int shelfLifeDays;
  late final String? packageSize;
  late final int packageCharge;
  late final int weightLoss;
  late final PackageSizePerStore packageSizePerStore;
  late final String id;
  late final String energyKcalPerUnit;
  late final String portionSize;
  late final String unit;
  late final String statisticsFactorLunch;
  late final String statisticsFactorEvening;
  late final Null cos;
  
  Ingredient.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = null;
    longDescription = null;
    nutrients = null;
    allergens = null;
    ingredients = null;
    image = null;
    tags = List.castFrom<dynamic, String>(json['tags']);
    available = json['available'];
    dietaryInfo = DietaryInfo.fromJson(json['dietaryInfo']);
    shelfLifeDays = json['shelfLifeDays'];
    packageSize = null;
    packageCharge = json['packageCharge'];
    weightLoss = json['weightLoss'];
    packageSizePerStore = PackageSizePerStore.fromJson(json['packageSizePerStore']);
    id = json['id'];
    energyKcalPerUnit = json['energyKcalPerUnit'];
    portionSize = json['portionSize'];
    unit = json['unit'];
    statisticsFactorLunch = json['statisticsFactorLunch'];
    statisticsFactorEvening = json['statisticsFactorEvening'];
    cos = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    _data['longDescription'] = longDescription;
    _data['nutrients'] = nutrients;
    _data['allergens'] = allergens;
    _data['ingredients'] = ingredients;
    _data['image'] = image;
    _data['tags'] = tags;
    _data['available'] = available;
    _data['dietaryInfo'] = dietaryInfo.toJson();
    _data['shelfLifeDays'] = shelfLifeDays;
    _data['packageSize'] = packageSize;
    _data['packageCharge'] = packageCharge;
    _data['weightLoss'] = weightLoss;
    _data['packageSizePerStore'] = packageSizePerStore.toJson();
    _data['id'] = id;
    _data['energyKcalPerUnit'] = energyKcalPerUnit;
    _data['portionSize'] = portionSize;
    _data['unit'] = unit;
    _data['statisticsFactorLunch'] = statisticsFactorLunch;
    _data['statisticsFactorEvening'] = statisticsFactorEvening;
    _data['cos'] = cos;
    return _data;
  }
}

class DietaryInfo {
  DietaryInfo({
    required this.allergens,
    required this.tags,
    required this.nutrients,
    required this.portionWeight,
    required this.nutrientsOverridden,
  });
  late final List<String> allergens;
  late final List<String> tags;
  late final Nutrients nutrients;
  late final int portionWeight;
  late final bool nutrientsOverridden;
  
  DietaryInfo.fromJson(Map<String, dynamic> json){
    tags = List.castFrom<dynamic, String>(json['tags']);
    nutrients = Nutrients.fromJson(json['nutrients']);
    portionWeight = json['portionWeight'];
    nutrientsOverridden = json['nutrientsOverridden'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['allergens'] = allergens;
    _data['tags'] = tags;
    _data['nutrients'] = nutrients.toJson();
    _data['portionWeight'] = portionWeight;
    _data['nutrientsOverridden'] = nutrientsOverridden;
    return _data;
  }
}

class Nutrients {
  Nutrients({
    required this.energyKcal,
     this.kJoule,
    required this.fat,
    required this.saturatedFattyAcids,
    required this.carbohydrates,
    required this.sugar,
    required this.fibers,
    required this.protein,
    required this.salt,
  });
  late final String energyKcal;
  late final String? kJoule;
  late final String fat;
  late final String saturatedFattyAcids;
  late final String carbohydrates;
  late final String sugar;
  late final String fibers;
  late final String protein;
  late final String salt;
  
  Nutrients.fromJson(Map<String, dynamic> json){
    energyKcal = json['energyKcal'];
    kJoule = null;
    fat = json['fat'];
    saturatedFattyAcids = json['saturatedFattyAcids'];
    carbohydrates = json['carbohydrates'];
    sugar = json['sugar'];
    fibers = json['fibers'];
    protein = json['protein'];
    salt = json['salt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['energyKcal'] = energyKcal;
    _data['kJoule'] = kJoule;
    _data['fat'] = fat;
    _data['saturatedFattyAcids'] = saturatedFattyAcids;
    _data['carbohydrates'] = carbohydrates;
    _data['sugar'] = sugar;
    _data['fibers'] = fibers;
    _data['protein'] = protein;
    _data['salt'] = salt;
    return _data;
  }
}

class PackageSizePerStore {
  PackageSizePerStore();
  
  PackageSizePerStore.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class _id {
  _id({
    required this.timestamp,
    required this.date,
  });
  late final int timestamp;
  late final String date;
  
  _id.fromJson(Map<String, dynamic> json){
    timestamp = json['timestamp'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['timestamp'] = timestamp;
    _data['date'] = date;
    return _data;
  }
}

class Includes {
  Includes({
    required this.name,
     this.byname,
     this.description,
     this.longDescription,
     this.type,
     this.locationBasedPrices,
     this.nutrients,
     this.allergens,
    required this.image,
    required this.price,
     this.notes,
    required this.tags,
    required this.productTags,
    required this.parts,
    required this.includes,
    required this.addons,
    required this.available,
    required this.sorting,
    required this.dietaryInfo,
     this.capacity,
     this.foodBusinessOperator,
     this.foodBusinessOperatorAddress,
     this.ingredientList,
     this.containerDepositInCent,
    required this.id,
     this.imageContainer,
     this.unavailabilityInfo,
    required this.statisticsFactorLunch,
    required this.statisticsFactorEvening,
    required this.energyKcal,
  });
  late final String name;
  late final Null byname;
  late final Null description;
  late final Null longDescription;
  late final Null type;
  late final Null locationBasedPrices;
  late final Null nutrients;
  late final Null allergens;
  late final String image;
  late final Price price;
  late final Null notes;
  late final List<String> tags;
  late final List<String> productTags;
  late final List<Parts> parts;
  late final List<dynamic> includes;
  late final List<dynamic> addons;
  late final bool available;
  late final int sorting;
  late final DietaryInfo dietaryInfo;
  late final Null capacity;
  late final Null foodBusinessOperator;
  late final Null foodBusinessOperatorAddress;
  late final Null ingredientList;
  late final Null containerDepositInCent;
  late final String id;
  late final Null _id;
  late final Null imageContainer;
  late final Null unavailabilityInfo;
  late final String statisticsFactorLunch;
  late final String statisticsFactorEvening;
  late final String energyKcal;
  
  Includes.fromJson(Map<String, dynamic> json){
    name = json['name'];
    byname = null;
    description = null;
    longDescription = null;
    type = null;
    locationBasedPrices = null;
    nutrients = null;
    allergens = null;
    image = json['image'];
    price = Price.fromJson(json['price']);
    notes = null;
    tags = List.castFrom<dynamic, String>(json['tags']);
    productTags = List.castFrom<dynamic, String>(json['productTags']);
    parts = List.from(json['parts']).map((e)=>Parts.fromJson(e)).toList();
    includes = List.castFrom<dynamic, dynamic>(json['includes']);
    addons = List.castFrom<dynamic, dynamic>(json['addons']);
    available = json['available'];
    sorting = json['sorting'];
    dietaryInfo = DietaryInfo.fromJson(json['dietaryInfo']);
    capacity = null;
    foodBusinessOperator = null;
    foodBusinessOperatorAddress = null;
    ingredientList = null;
    containerDepositInCent = null;
    id = json['id'];
    _id = null;
    imageContainer = null;
    unavailabilityInfo = null;
    statisticsFactorLunch = json['statisticsFactorLunch'];
    statisticsFactorEvening = json['statisticsFactorEvening'];
    energyKcal = json['energyKcal'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['byname'] = byname;
    _data['description'] = description;
    _data['longDescription'] = longDescription;
    _data['type'] = type;
    _data['locationBasedPrices'] = locationBasedPrices;
    _data['nutrients'] = nutrients;
    _data['allergens'] = allergens;
    _data['image'] = image;
    _data['price'] = price.toJson();
    _data['notes'] = notes;
    _data['tags'] = tags;
    _data['productTags'] = productTags;
    _data['parts'] = parts.map((e)=>e.toJson()).toList();
    _data['includes'] = includes;
    _data['addons'] = addons;
    _data['available'] = available;
    _data['sorting'] = sorting;
    _data['dietaryInfo'] = dietaryInfo.toJson();
    _data['capacity'] = capacity;
    _data['foodBusinessOperator'] = foodBusinessOperator;
    _data['foodBusinessOperatorAddress'] = foodBusinessOperatorAddress;
    _data['ingredientList'] = ingredientList;
    _data['containerDepositInCent'] = containerDepositInCent;
    _data['id'] = id;
    _data['_id'] = _id;
    _data['imageContainer'] = imageContainer;
    _data['unavailabilityInfo'] = unavailabilityInfo;
    _data['statisticsFactorLunch'] = statisticsFactorLunch;
    _data['statisticsFactorEvening'] = statisticsFactorEvening;
    _data['energyKcal'] = energyKcal;
    return _data;
  }
}

class Addons {
  Addons({
    required this.name,
     this.byname,
     this.description,
     this.longDescription,
     this.type,
     this.locationBasedPrices,
     this.nutrients,
     this.allergens,
    required this.image,
    required this.price,
     this.notes,
    required this.tags,
    required this.productTags,
    required this.parts,
    required this.includes,
    required this.addons,
    required this.available,
    required this.sorting,
    required this.dietaryInfo,
     this.capacity,
     this.foodBusinessOperator,
     this.foodBusinessOperatorAddress,
     this.ingredientList,
     this.containerDepositInCent,
    required this.id,
     this.imageContainer,
     this.unavailabilityInfo,
    required this.statisticsFactorLunch,
    required this.statisticsFactorEvening,
    required this.energyKcal,
  });
  late final String name;
  late final Null byname;
  late final String? description;
  late final Null longDescription;
  late final Null type;
  late final Null locationBasedPrices;
  late final Null nutrients;
  late final Null allergens;
  late final String image;
  late final Price price;
  late final Null notes;
  late final List<String> tags;
  late final List<String> productTags;
  late final List<Parts> parts;
  late final List<dynamic> includes;
  late final List<dynamic> addons;
  late final bool available;
  late final int sorting;
  late final DietaryInfo dietaryInfo;
  late final Null capacity;
  late final Null foodBusinessOperator;
  late final Null foodBusinessOperatorAddress;
  late final Null ingredientList;
  late final Null containerDepositInCent;
  late final String id;
  late final Null _id;
  late final Null imageContainer;
  late final String? unavailabilityInfo;
  late final String statisticsFactorLunch;
  late final String statisticsFactorEvening;
  late final String energyKcal;
  
  Addons.fromJson(Map<String, dynamic> json){
    name = json['name'];
    byname = null;
    description = null;
    longDescription = null;
    type = null;
    locationBasedPrices = null;
    nutrients = null;
    allergens = null;
    image = json['image'];
    price = Price.fromJson(json['price']);
    notes = null;
    tags = List.castFrom<dynamic, String>(json['tags']);
    productTags = List.castFrom<dynamic, String>(json['productTags']);
    parts = List.from(json['parts']).map((e)=>Parts.fromJson(e)).toList();
    includes = List.castFrom<dynamic, dynamic>(json['includes']);
    addons = List.castFrom<dynamic, dynamic>(json['addons']);
    available = json['available'];
    sorting = json['sorting'];
    dietaryInfo = DietaryInfo.fromJson(json['dietaryInfo']);
    capacity = null;
    foodBusinessOperator = null;
    foodBusinessOperatorAddress = null;
    ingredientList = null;
    containerDepositInCent = null;
    id = json['id'];
    _id = null;
    imageContainer = null;
    unavailabilityInfo = null;
    statisticsFactorLunch = json['statisticsFactorLunch'];
    statisticsFactorEvening = json['statisticsFactorEvening'];
    energyKcal = json['energyKcal'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['byname'] = byname;
    _data['description'] = description;
    _data['longDescription'] = longDescription;
    _data['type'] = type;
    _data['locationBasedPrices'] = locationBasedPrices;
    _data['nutrients'] = nutrients;
    _data['allergens'] = allergens;
    _data['image'] = image;
    _data['price'] = price.toJson();
    _data['notes'] = notes;
    _data['tags'] = tags;
    _data['productTags'] = productTags;
    _data['parts'] = parts.map((e)=>e.toJson()).toList();
    _data['includes'] = includes;
    _data['addons'] = addons;
    _data['available'] = available;
    _data['sorting'] = sorting;
    _data['dietaryInfo'] = dietaryInfo.toJson();
    _data['capacity'] = capacity;
    _data['foodBusinessOperator'] = foodBusinessOperator;
    _data['foodBusinessOperatorAddress'] = foodBusinessOperatorAddress;
    _data['ingredientList'] = ingredientList;
    _data['containerDepositInCent'] = containerDepositInCent;
    _data['id'] = id;
    _data['_id'] = _id;
    _data['imageContainer'] = imageContainer;
    _data['unavailabilityInfo'] = unavailabilityInfo;
    _data['statisticsFactorLunch'] = statisticsFactorLunch;
    _data['statisticsFactorEvening'] = statisticsFactorEvening;
    _data['energyKcal'] = energyKcal;
    return _data;
  }
}

class DeliveryPrice {
  DeliveryPrice({
    required this.withVat,
    required this.withoutVat,
    required this.vat,
    required this.vatAmount,
  });
  late final String withVat;
  late final String withoutVat;
  late final String vat;
  late final String vatAmount;
  
  DeliveryPrice.fromJson(Map<String, dynamic> json){
    withVat = json['withVat'];
    withoutVat = json['withoutVat'];
    vat = json['vat'];
    vatAmount = json['vatAmount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['withVat'] = withVat;
    _data['withoutVat'] = withoutVat;
    _data['vat'] = vat;
    _data['vatAmount'] = vatAmount;
    return _data;
  }
}

class Address {
  Address({
    required this.street,
    required this.city,
    required this.zipCode,
     this.company,
  });
  late final String street;
  late final String city;
  late final String zipCode;
  late final Null company;
  
  Address.fromJson(Map<String, dynamic> json){
    street = json['street'];
    city = json['city'];
    zipCode = json['zipCode'];
    company = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['street'] = street;
    _data['city'] = city;
    _data['zipCode'] = zipCode;
    _data['company'] = company;
    return _data;
  }
}

class Images {
  Images({
    required this.storeTeaser,
  });
  late final String storeTeaser;
  
  Images.fromJson(Map<String, dynamic> json){
    storeTeaser = json['storeTeaser'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['storeTeaser'] = storeTeaser;
    return _data;
  }
}

class BusinessDay {
  BusinessDay({
    required this.end,
    required this.notes,
    required this.businessHours,
    required this.deliveryGroupId,
    required this.storeBusinessHours,
    required this.id,
  });
  late final String end;
  late final List<dynamic> notes;
  late final List<BusinessHours> businessHours;
  late final String deliveryGroupId;
  late final StoreBusinessHours storeBusinessHours;
  late final String id;
  late final Null _id;
  
  BusinessDay.fromJson(Map<String, dynamic> json){
    end = json['end'];
    notes = List.castFrom<dynamic, dynamic>(json['notes']);
    businessHours = List.from(json['businessHours']).map((e)=>BusinessHours.fromJson(e)).toList();
    deliveryGroupId = json['deliveryGroupId'];
    storeBusinessHours = StoreBusinessHours.fromJson(json['storeBusinessHours']);
    id = json['id'];
    _id = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['end'] = end;
    _data['notes'] = notes;
    _data['businessHours'] = businessHours.map((e)=>e.toJson()).toList();
    _data['deliveryGroupId'] = deliveryGroupId;
    _data['storeBusinessHours'] = storeBusinessHours.toJson();
    _data['id'] = id;
    _data['_id'] = _id;
    return _data;
  }
}

class BusinessHours {
  BusinessHours({
    required this.openingTime,
    required this.closingTime,
    required this.deliveryAreaId,
  });
  late final String openingTime;
  late final String closingTime;
  late final String deliveryAreaId;
  
  BusinessHours.fromJson(Map<String, dynamic> json){
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
    deliveryAreaId = json['deliveryAreaId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['openingTime'] = openingTime;
    _data['closingTime'] = closingTime;
    _data['deliveryAreaId'] = deliveryAreaId;
    return _data;
  }
}

class StoreBusinessHours {
  StoreBusinessHours();
  
  StoreBusinessHours.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class NextBusinessDays {
  NextBusinessDays({
    required this.end,
    required this.notes,
    required this.businessHours,
    required this.deliveryGroupId,
    required this.storeBusinessHours,
    required this.id,
  });
  late final String end;
  late final List<dynamic> notes;
  late final List<BusinessHours> businessHours;
  late final String deliveryGroupId;
  late final StoreBusinessHours storeBusinessHours;
  late final String id;
  late final Null _id;
  
  NextBusinessDays.fromJson(Map<String, dynamic> json){
    end = json['end'];
    notes = List.castFrom<dynamic, dynamic>(json['notes']);
    businessHours = List.from(json['businessHours']).map((e)=>BusinessHours.fromJson(e)).toList();
    deliveryGroupId = json['deliveryGroupId'];
    storeBusinessHours = StoreBusinessHours.fromJson(json['storeBusinessHours']);
    id = json['id'];
    _id = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['end'] = end;
    _data['notes'] = notes;
    _data['businessHours'] = businessHours.map((e)=>e.toJson()).toList();
    _data['deliveryGroupId'] = deliveryGroupId;
    _data['storeBusinessHours'] = storeBusinessHours.toJson();
    _data['id'] = id;
    _data['_id'] = _id;
    return _data;
  }
}

class Alert {
  Alert({
    required this.enabled,
    required this.message,
    required this.severity,
  });
  late final bool enabled;
  late final String message;
  late final String severity;
  
  Alert.fromJson(Map<String, dynamic> json){
    enabled = json['enabled'];
    message = json['message'];
    severity = json['severity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['enabled'] = enabled;
    _data['message'] = message;
    _data['severity'] = severity;
    return _data;
  }
}