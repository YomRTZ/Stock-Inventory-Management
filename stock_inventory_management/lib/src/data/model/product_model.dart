// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

// import 'package:stock_inventory_management/src/data/model/user_model.dart';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    Data? data;

    Products({
        this.data,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? productName;
    String? description;
    Category? category;
    //  Datum? supplier; 
    String? price;
    int? quantityInStock;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.productName,
        this.description,
        this.category,
        // this.supplier,
        this.price,
        this.quantityInStock,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        productName: json["product_name"],
        description: json["description"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        // supplier: json["supplier"] == null ? null : Datum.fromJson(json["supplier"]),
        price: json["price"],
        quantityInStock: json["quantity_in_stock"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "description": description,
        "category": category?.toJson(),
        // "supplier": supplier?.toJson(),
        "price": price,
        "quantity_in_stock": quantityInStock,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Category {
    int? id;
    String? name;

    Category({
        this.id,
        this.name,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
