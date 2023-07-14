// To parse this JSON data, do
//
//     final posting = postingFromJson(jsonString);

import 'dart:convert';

Posting postingFromJson(String str) => Posting.fromJson(json.decode(str));

String postingToJson(Posting data) => json.encode(data.toJson());

class Posting {
    int id;
    String name;
    String country;
    String logo;
    String slogan;
    String headquaters;
    String website;
    String established;

    Posting({
        required this.id,
        required this.name,
        required this.country,
        required this.logo,
        required this.slogan,
        required this.headquaters,
        required this.website,
        required this.established,
    });

    factory Posting.fromJson(Map<String, dynamic> json) => Posting(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        slogan: json["slogan"],
        headquaters: json["head_quaters"],
        website: json["website"],
        established: json["established"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "slogan": slogan,
        "head_quaters": headquaters,
        "website": website,
        "established": established,
    };
}
