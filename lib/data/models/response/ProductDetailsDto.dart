import 'package:e_commerce/domain/entities/category/CategoryResponseEntity.dart';
import 'package:e_commerce/domain/entities/products/ProductDetailsEntity.dart';
import 'package:e_commerce/domain/entities/products/ProductResponseEntity.dart';

class ProductDetailsDto extends ProductDetailsEntity {
  ProductDetailsDto({
    super.data,
  });

  ProductDetailsDto.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data extends ProductEntity {
  Data({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    this.v,
    this.reviews,
  });

  Data.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'];
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add((v));
      });
    }
    id = json['id'];
  }

  num? v;
  List<dynamic>? reviews;

// Map<String, dynamic> toJson() {
//   final map = <String, dynamic>{};
//   map['sold'] = sold;
//   map['images'] = images;
//   if (subcategory != null) {
//     map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
//   }
//   map['ratingsQuantity'] = ratingsQuantity;
//   map['_id'] = id;
//   map['title'] = title;
//   map['slug'] = slug;
//   map['description'] = description;
//   map['quantity'] = quantity;
//   map['price'] = price;
//   map['imageCover'] = imageCover;
//   if (category != null) {
//     map['category'] = category?.toJson();
//   }
//   map['brand'] = brand;
//   map['ratingsAverage'] = ratingsAverage;
//   map['createdAt'] = createdAt;
//   map['updatedAt'] = updatedAt;
//   map['__v'] = v;
//   if (reviews != null) {
//     map['reviews'] = reviews?.map((v) => v.toJson()).toList();
//   }
//   map['id'] = id;
//   return map;
// }
}

class Category extends CategoryEntity {
  Category({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }
}

class Subcategory extends SubcategoryEntity {
  Subcategory({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }
}
