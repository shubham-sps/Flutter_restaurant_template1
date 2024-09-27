import 'package:get/get.dart';

class FoodItemsModal {
  List<Items>? items;
  int? totalCount;

  FoodItemsModal({this.items, this.totalCount});

  FoodItemsModal.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = totalCount;
    return data;
  }

  static fromMap(Map<String, dynamic> map) {}
}

class Items {
  int? id;
  String? name;
  String? price;
  String? shortDescription;
  String? categoryId;
  RxInt quantity = 1.obs;
  List<Addons>? addons;

  Items({
    this.id,
    this.name,
    this.price,
    this.shortDescription,
    this.categoryId,
    this.addons,
    required this.quantity,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    shortDescription = json['shortDescription'];
    categoryId = json['categoryId'];
    if (json['addons'] != null) {
      addons = <Addons>[];
      json['addons'].forEach((v) {
        addons!.add(Addons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['shortDescription'] = shortDescription;
    data['categoryId'] = categoryId;
    if (addons != null) {
      data['addons'] = addons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addons {
  int? addonId;
  String? title;
  String? menutype;
  String? addonlimit;
  String? addonType;
  String? productId;
  int? displayNumber;
  String? toppingname;
  String? toppingprice;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;

  Addons(
      {this.addonId,
      this.title,
      this.menutype,
      this.addonlimit,
      this.addonType,
      this.productId,
      this.displayNumber,
      this.toppingname,
      this.toppingprice,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  Addons.fromJson(Map<String, dynamic> json) {
    addonId = json['addon_id'];
    title = json['title'];
    menutype = json['menutype'];
    addonlimit = json['addonlimit'];
    addonType = json['addon_type'];
    productId = json['product_id'];
    displayNumber = json['display_number'];
    toppingname = json['toppingname'];
    toppingprice = json['toppingprice'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addon_id'] = addonId;
    data['title'] = title;
    data['menutype'] = menutype;
    data['addonlimit'] = addonlimit;
    data['addon_type'] = addonType;
    data['product_id'] = productId;
    data['display_number'] = displayNumber;
    data['toppingname'] = toppingname;
    data['toppingprice'] = toppingprice;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
