import 'dart:convert';

Welcome2 welcomeFromJson(String str) => Welcome2.fromJson(json.decode(str));

String welcomeToJson(Welcome2 data) => json.encode(data.toJson());

class Welcome2 {
  int id;
  String commonName;
  List<String> scientificName;
  // List<String> otherName;
  String ?family;
  List<String> ?origin;
  String ? type;
  String ?dimension;
  String ?cycle;
  // List<dynamic> attracts;
  // List<String> propagation;
  // Hardiness hardiness;
  // HardinessLocation hardinessLocation;
  String ?watering;
  List<String>? sunlight;
  String? maintenance;
  // String careGuides;
  // // List<String> soil;
  String ?growthRate;
  // bool droughtTolerant;
  // bool saltTolerant;
  // bool thorny;
  // bool invasive;
  // bool tropical;
  // bool indoor;
  // String careLevel;
  // String pestSusceptibility;
  // String pestSusceptibilityApi;
  // bool flowers;
  //String floweringSeason;
  // String flowerColor;
  // bool cones;
  // bool fruits;
  // bool edibleFruit;
  // String edibleFruitTasteProfile;
  // String fruitNutritionalValue;
  // List<dynamic> fruitColor;
  // String harvestSeason;
  // String harvestMethod;
  // bool leaf;
  // List<String> leafColor;
  // bool edibleLeaf;
  // String edibleLeafTasteProfile;
  // String leafNutritionalValue;
  // bool cuisine;
  // String cuisineList;
  // String medicinal;
  // String medicinalUse;
  // String medicinalMethod;
  // String poisonousToHumans;
  // String poisonEffectsToHumans;
  // String poisonToHumansCure;
  // String poisonousToPets;
  // String poisonEffectsToPets;
  // String poisonToPetsCure;
  // String rare;
  // String rareLevel;
  // String endangered;
  // String endangeredLevel;
  // String description;
  // String problem;
  DefaultImage defaultImage;

  Welcome2({
    required this.id,
    required this.commonName,
    required this.scientificName,
    // required this.otherName,
    this.family,
    this.origin,
    this.type,
    this.dimension,
    this.cycle,
    // required this.attracts,
    // required this.propagation,
    // required this.hardiness,
    // required this.hardinessLocation,
    this.watering,
    this.sunlight,
    this.maintenance,
    // required this.careGuides,
    // required this.soil,
    this.growthRate,
    // required this.droughtTolerant,
    // required this.saltTolerant,
    // required this.thorny,
    // required this.invasive,
    // required this.tropical,
    // required this.indoor,
    // required this.careLevel,
    // required this.pestSusceptibility,
    // required this.pestSusceptibilityApi,
    // required this.flowers,
    //required this.floweringSeason,
    // required this.flowerColor,
    // required this.cones,
    // required this.fruits,
    // required this.edibleFruit,
    // required this.edibleFruitTasteProfile,
    // required this.fruitNutritionalValue,
    // required this.fruitColor,
    // required this.harvestSeason,
    // required this.harvestMethod,
    // required this.leaf,
    // required this.leafColor,
    // required this.edibleLeaf,
    // required this.edibleLeafTasteProfile,
    // required this.leafNutritionalValue,
    // required this.cuisine,
    // required this.cuisineList,
    // required this.medicinal,
    // required this.medicinalUse,
    // required this.medicinalMethod,
    // required this.poisonousToHumans,
    // required this.poisonEffectsToHumans,
    // required this.poisonToHumansCure,
    // required this.poisonousToPets,
    // required this.poisonEffectsToPets,
    // required this.poisonToPetsCure,
    // required this.rare,
    // required this.rareLevel,
    // required this.endangered,
    // required this.endangeredLevel,
    // required this.description,
    // required this.problem,
    required this.defaultImage,
  });

  factory Welcome2.fromJson(Map<String, dynamic> json) => Welcome2(
    id: json["id"],
    commonName: json["common_name"],
    scientificName: List<String>.from(json["scientific_name"].map((x) => x)),
    // otherName: List<String>.from(json["other_name"].map((x) => x)),
    family: json["family"],
    origin: List<String>.from(json["origin"].map((x) => x)),
    type: json["type"],
    dimension: json["dimension"],
    cycle: json["cycle"],
    // attracts: List<dynamic>.from(json["attracts"].map((x) => x)),
    // propagation: List<String>.from(json["propagation"].map((x) => x)),
    // hardiness: Hardiness.fromJson(json["hardiness"]),
    // hardinessLocation: HardinessLocation.fromJson(json["hardiness_location"]),
    watering: json["watering"],
    sunlight: List<String>.from(json["sunlight"].map((x) => x)),
    maintenance: json["maintenance"],
    // careGuides: json["care-guides"],
    // soil: List<String>.from(json["soil"].map((x) => x)),
    growthRate: json["growth_rate"],
    // droughtTolerant: json["drought_tolerant"],
    // saltTolerant: json["salt_tolerant"],
    // thorny: json["thorny"],
    // invasive: json["invasive"],
    // tropical: json["tropical"],
    // indoor: json["indoor"],
    // careLevel: json["care_level"],
    // pestSusceptibility: json["pest_susceptibility"],
    // pestSusceptibilityApi: json["pest_susceptibility_api"],
    // flowers: json["flowers"],
    //floweringSeason: json["flowering_season"],
    // flowerColor: json["flower_color"],
    // cones: json["cones"],
    // fruits: json["fruits"],
    // edibleFruit: json["edible_fruit"],
    // edibleFruitTasteProfile: json["edible_fruit_taste_profile"],
    // fruitNutritionalValue: json["fruit_nutritional_value"],
    // fruitColor: List<dynamic>.from(json["fruit_color"].map((x) => x)),
    // harvestSeason: json["harvest_season"],
    // harvestMethod: json["harvest_method"],
    // leaf: json["leaf"],
    // leafColor: List<String>.from(json["leaf_color"].map((x) => x)),
    // edibleLeaf: json["edible_leaf"],
    // edibleLeafTasteProfile: json["edible_leaf_taste_profile"],
    // leafNutritionalValue: json["leaf_nutritional_value"],
    // cuisine: json["cuisine"],
    // cuisineList: json["cuisine_list"],
    // medicinal: json["medicinal"],
    // medicinalUse: json["medicinal_use"],
    // medicinalMethod: json["medicinal_method"],
    // poisonousToHumans: json["poisonous_to_humans"],
    // poisonEffectsToHumans: json["poison_effects_to_humans"],
    // poisonToHumansCure: json["poison_to_humans_cure"],
    // poisonousToPets: json["poisonous_to_pets"],
    // poisonEffectsToPets: json["poison_effects_to_pets"],
    // poisonToPetsCure: json["poison_to_pets_cure"],
    // rare: json["rare"],
    // rareLevel: json["rare_level"],
    // endangered: json["endangered"],
    // endangeredLevel: json["endangered_level"],
    // description: json["description"],
    // problem: json["problem"],
    defaultImage: DefaultImage.fromJson(json["default_image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "common_name": commonName,
    // "scientific_name": List<dynamic>.from(scientificName.map((x) => x)),
    // "other_name": List<dynamic>.from(otherName.map((x) => x)),
    // "family": family,
    // "origin": List<dynamic>.from(origin.map((x) => x)),
    // "type": type,
    // "dimension": dimension,
    // "cycle": cycle,
    // "attracts": List<dynamic>.from(attracts.map((x) => x)),
    // "propagation": List<dynamic>.from(propagation.map((x) => x)),
    // "hardiness": hardiness.toJson(),
    // "hardiness_location": hardinessLocation.toJson(),
    // "watering": watering,
    // "sunlight": List<dynamic>.from(sunlight.map((x) => x)),
    // "maintenance": maintenance,
    // "care-guides": careGuides,
    // "soil": List<dynamic>.from(soil.map((x) => x)),
    // "growth_rate": growthRate,
    // "drought_tolerant": droughtTolerant,
    // "salt_tolerant": saltTolerant,
    // "thorny": thorny,
    // "invasive": invasive,
    // "tropical": tropical,
    // "indoor": indoor,
    // "care_level": careLevel,
    // "pest_susceptibility": pestSusceptibility,
    // "pest_susceptibility_api": pestSusceptibilityApi,
    // "flowers": flowers,
    // "flowering_season": floweringSeason,
    // "flower_color": flowerColor,
    // "cones": cones,
    // "fruits": fruits,
    // "edible_fruit": edibleFruit,
    // "edible_fruit_taste_profile": edibleFruitTasteProfile,
    // "fruit_nutritional_value": fruitNutritionalValue,
    // "fruit_color": List<dynamic>.from(fruitColor.map((x) => x)),
    // "harvest_season": harvestSeason,
    // "harvest_method": harvestMethod,
    // "leaf": leaf,
    // "leaf_color": List<dynamic>.from(leafColor.map((x) => x)),
    // "edible_leaf": edibleLeaf,
    // "edible_leaf_taste_profile": edibleLeafTasteProfile,
    // "leaf_nutritional_value": leafNutritionalValue,
    // "cuisine": cuisine,
    // "cuisine_list": cuisineList,
    // "medicinal": medicinal,
    // "medicinal_use": medicinalUse,
    // "medicinal_method": medicinalMethod,
    // "poisonous_to_humans": poisonousToHumans,
    // "poison_effects_to_humans": poisonEffectsToHumans,
    // "poison_to_humans_cure": poisonToHumansCure,
    // "poisonous_to_pets": poisonousToPets,
    // "poison_effects_to_pets": poisonEffectsToPets,
    // "poison_to_pets_cure": poisonToPetsCure,
    // "rare": rare,
    // "rare_level": rareLevel,
    // "endangered": endangered,
    // "endangered_level": endangeredLevel,
    // "description": description,
    // "problem": problem,
    "default_image": defaultImage.toJson(),
  };
}

class DefaultImage {
  // int license;
  // String licenseName;
  // String licenseUrl;
  String originalUrl;
  // String regularUrl;
  // String mediumUrl;
  // String smallUrl;
  // String thumbnail;

  DefaultImage({
    // required this.license,
    // required this.licenseName,
    // required this.licenseUrl,
    required this.originalUrl,
    // required this.regularUrl,
    // required this.mediumUrl,
    // required this.smallUrl,
    // required this.thumbnail,
  });

  factory DefaultImage.fromJson(Map<String, dynamic> json) => DefaultImage(
    // license: json["license"],
    // licenseName: json["license_name"],
    // licenseUrl: json["license_url"],
    originalUrl: json["original_url"],
    // regularUrl: json["regular_url"],
    // mediumUrl: json["medium_url"],
    // smallUrl: json["small_url"],
    // thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    // "license": license,
    // "license_name": licenseName,
    // "license_url": licenseUrl,
    "original_url": originalUrl,
    // "regular_url": regularUrl,
    // "medium_url": mediumUrl,
    // "small_url": smallUrl,
    // "thumbnail": thumbnail,
  };
}

class Hardiness {
  String min;
  String max;

  Hardiness({
    required this.min,
    required this.max,
  });

  factory Hardiness.fromJson(Map<String, dynamic> json) => Hardiness(
    min: json["min"],
    max: json["max"],
  );

  Map<String, dynamic> toJson() => {
    "min": min,
    "max": max,
  };
}

class HardinessLocation {
  String fullUrl;
  String fullIframe;

  HardinessLocation({
    required this.fullUrl,
    required this.fullIframe,
  });

  factory HardinessLocation.fromJson(Map<String, dynamic> json) => HardinessLocation(
    fullUrl: json["full_url"],
    fullIframe: json["full_iframe"],
  );

  Map<String, dynamic> toJson() => {
    "full_url": fullUrl,
    "full_iframe": fullIframe,
  };
}
