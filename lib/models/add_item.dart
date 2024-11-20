// To parse this JSON data, do
//
//     final addItem = addItemFromJson(jsonString);

import 'dart:convert';

List<AddItem> addItemFromJson(String str) => List<AddItem>.from(json.decode(str).map((x) => AddItem.fromJson(x)));

String addItemToJson(List<AddItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddItem {
    String model;
    String pk;
    Fields fields;

    AddItem({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory AddItem.fromJson(Map<String, dynamic> json) => AddItem(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    String photoUrl;
    String price;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.photoUrl,
        required this.price,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        photoUrl: json["photo_url"],
        price: json["price"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "photo_url": photoUrl,
        "price": price,
        "description": description,
    };
}
