import 'dart:convert';
import 'package:objectbox/objectbox.dart';


List<Annee> parseAnnees(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Annee>((json) =>Annee.fromJson(json)).toList();
}

class Annee {
  final int id;
  final int valeur;
  final String name;


  Annee(this.id,this.valeur,this.name) ;


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'valeur': valeur,
      'name': name,
    };
  }


  factory Annee.fromJson(Map<String, dynamic> json) {
    return Annee(
      json['id'],
      // json['valeur'],
      int.parse(json['valeur'].toString()),
      json['name'],

    );
  }

  @override
  String toString() =>
      'Annee(id: $id, valeur: $valeur, name: $name)';
}

