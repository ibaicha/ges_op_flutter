import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';
part 'objectBoxModels.g.dart';

/* ------------------------ PersonneObject --------------------------- */
@Entity()
class PersonneObject {
  int id;
  int age;
  int poids;
  String name;
  PersonneObject(
      {this.id = 0,
      required this.age,
      required this.poids,
      required this.name});
}

/* ------------------------ UserObject --------------------------- */
List<UserObject> UserObjectFromJson(String str) =>
    List<UserObject>.from(json.decode(str).map((x) => UserObject.fromJson(x)));

@JsonSerializable()
@Entity()
class UserObject {
  @Id(assignable: true)
  int id;
  String token;
  String email;
  String password;
  String firstname;
  String lastname;
  int? profil_id;
  String? profil_name;
  int? producteur_id;
  String? producteur_prenom;
  String? producteur_nom;
  String? producteur_cni;
  int? op_id;
  String? op_name;
  int? sous_zone_id;
  String? sous_zone_name;
  int? zone_id;
  String? zone_name;

  UserObject(
      {required this.id,
      required this.token,
      required this.email,
      required this.password,
      required this.firstname,
      required this.lastname,
      required this.profil_id,
      required this.producteur_id,
      required this.producteur_prenom,
      required this.producteur_nom,
      required this.producteur_cni,
      required this.profil_name,
      required this.op_id,
      required this.op_name,
      required this.sous_zone_id,
      required this.sous_zone_name,
      required this.zone_id,
      required this.zone_name});

  /// factory.
  factory UserObject.fromJson(Map<String, dynamic> json) =>
      _$UserObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$UserObjectToJson(this);
}

/* ------------------------ SaisonObject --------------------------- */
List<SaisonObject> SaisonObjectFromJson(String str) => List<SaisonObject>.from(
    json.decode(str).map((x) => SaisonObject.fromJson(x)));

@JsonSerializable()
@Entity()
class SaisonObject {
  @Id(assignable: true)
  int id;
  String name;
  String description;
  SaisonObject(
      {required this.id, required this.name, required this.description});

  /// factory.
  factory SaisonObject.fromJson(Map<String, dynamic> json) =>
      _$SaisonObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$SaisonObjectToJson(this);
}

/* ------------------------ AnneeObject --------------------------- */
@Entity()
class AnneeObject {
  @Id(assignable: true)
  int id;
  int valeur;
  String name;
  AnneeObject({required this.id, required this.valeur, required this.name});
}

/* ------------------------ varieteObject --------------------------- */
List<VarieteObject> VarieteObjectFromJson(String str) =>
    List<VarieteObject>.from(
        json.decode(str).map((x) => VarieteObject.fromJson(x)));

@JsonSerializable()
@Entity()
class VarieteObject {
  @Id(assignable: true)
  int id;
  String name;
  String? surface_unite;
  String? quantite_unite;
  double? rendement_unite;
  int produit_id;
  String produit_name;
  int filiere_id;
  String filiere_name;
  int familleemplacement_id;
  String familleemplacement_name;

  VarieteObject({
    required this.id,
    required this.name,
    required this.surface_unite,
    required this.quantite_unite,
    required this.rendement_unite,
    required this.produit_id,
    required this.produit_name,
    required this.filiere_id,
    required this.filiere_name,
    required this.familleemplacement_id,
    required this.familleemplacement_name,
  });

  /// factory.
  factory VarieteObject.fromJson(Map<String, dynamic> json) =>
      _$VarieteObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$VarieteObjectToJson(this);
}

/* ------------------------ TypeChargeObject --------------------------- */
@Entity()
class TypeChargeObject {
  @Id(assignable: true)
  int id;
  String name;
  TypeChargeObject({required this.id, required this.name});
}

/* ------------------------ TypeChargeExploitationObject --------------------------- */
@Entity()
class TypeChargeExploitationObject {
  @Id(assignable: true)
  int id;
  String name;
  TypeChargeExploitationObject({required this.id, required this.name});
}

/* ------------------------ FamilleChargeExploitationObject --------------------------- */

List<FamilleChargeExploitationObject> FamilleChargeExploitationObjectFromJson(
        String str) =>
    List<FamilleChargeExploitationObject>.from(json
        .decode(str)
        .map((x) => FamilleChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class FamilleChargeExploitationObject {
  @Id(assignable: true)
  int id;
  String name;
  FamilleChargeExploitationObject({required this.id, required this.name});

  /// factory.
  factory FamilleChargeExploitationObject.fromJson(Map<String, dynamic> json) =>
      _$FamilleChargeExploitationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() =>
      _$FamilleChargeExploitationObjectToJson(this);
}

/* ------------------------ TypeOpObject --------------------------- */
List<TypeOpObject> TypeOpObjectFromJson(String str) => List<TypeOpObject>.from(
    json.decode(str).map((x) => TypeOpObject.fromJson(x)));

@JsonSerializable()
@Entity()
class TypeOpObject {
  @Id(assignable: true)
  int id;
  String name;
  TypeOpObject({required this.id, required this.name});

  /// factory.
  factory TypeOpObject.fromJson(Map<String, dynamic> json) =>
      _$TypeOpObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$TypeOpObjectToJson(this);
}

/* ------------------------ ChargeExploitationObject --------------------------- */
List<ChargeExploitationObject> ChargeExploitationObjectFromJson(String str) =>
    List<ChargeExploitationObject>.from(
        json.decode(str).map((x) => ChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class ChargeExploitationObject {
  @Id(assignable: true)
  int id;
  String name;
  String unite;
  double pu;
  double quantite_unite_superficie;
  int produit_id;
  String produit_name;
  int famille_charge_exploitation_id;
  String famille_charge_exploitation_name;
  int type_charge_exploitation_id;
  String type_charge_exploitation_name;
  bool isAchat;

  ChargeExploitationObject({
    required this.id,
    required this.name,
    required this.unite,
    required this.pu,
    required this.quantite_unite_superficie,
    required this.produit_id,
    required this.produit_name,
    required this.famille_charge_exploitation_id,
    required this.famille_charge_exploitation_name,
    required this.type_charge_exploitation_id,
    required this.type_charge_exploitation_name,
    required this.isAchat,
  });

  /// factory.
  factory ChargeExploitationObject.fromJson(Map<String, dynamic> json) =>
      _$ChargeExploitationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$ChargeExploitationObjectToJson(this);
}

/* ------------------------ ExploitationObject --------------------------- */
List<ExploitationObject> ExploitationObjectFromJson(String str) =>
    List<ExploitationObject>.from(
        json.decode(str).map((x) => ExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class ExploitationObject {
  @Id(assignable: true)
  int id;

  int producteur_id;
  String prenom;
  String nom;
  String cni;
  String email;
  bool is_actif;
  int op_id;
  String op_name;
  int type_op_id;
  String type_op_name;
  int exploitation_id;

  String compte;
  String unite;
  double production_prevision;
  double superficie_prevision;
  double pu_prevision;
  int variete_prevision_id;
  String variete_prevision_name;
  int produit_prevision_id;
  String produit_prevision_name;
  int filiere_prevision_id;
  String filiere_prevision_name;
  double production;
  double superficie;
  double pu;
  int variete_id;
  String variete_name;
  int produit_id;
  String produit_name;
  int filiere_id;
  String filiere_name;
  int annne_id;
  String annee_name;
  int saison_id;
  String saison_name;

  ExploitationObject({
    required this.id,
    required this.producteur_id,
    required this.prenom,
    required this.nom,
    required this.cni,
    required this.email,
    required this.is_actif,
    required this.op_id,
    required this.op_name,
    required this.type_op_id,
    required this.type_op_name,
    required this.exploitation_id,
    required this.compte,
    required this.unite,
    required this.production_prevision,
    required this.superficie_prevision,
    required this.pu_prevision,
    required this.variete_prevision_id,
    required this.variete_prevision_name,
    required this.produit_prevision_id,
    required this.produit_prevision_name,
    required this.filiere_prevision_id,
    required this.filiere_prevision_name,
    required this.production,
    required this.superficie,
    required this.pu,
    required this.variete_id,
    required this.variete_name,
    required this.produit_id,
    required this.produit_name,
    required this.filiere_id,
    required this.filiere_name,
    required this.annne_id,
    required this.annee_name,
    required this.saison_id,
    required this.saison_name,
  });

  static final empty = ExploitationObject(
    id: 0,
    producteur_id: 0,
    prenom: '',
    nom: '',
    cni: '',
    email: '',
    is_actif: false,
    op_id: 0,
    op_name: '',
    type_op_id: 0,
    type_op_name: '',
    exploitation_id: 0,
    compte: '',
    unite: '',
    superficie_prevision: 0,
    production_prevision: 0,
    pu_prevision: 0,
    filiere_prevision_id: 0,
    filiere_prevision_name: '',
    produit_prevision_id: 0,
    produit_prevision_name: '',
    variete_prevision_id: 0,
    variete_prevision_name: '',
    superficie: 0,
    production: 0,
    pu: 0,
    filiere_id: 0,
    filiere_name: '',
    produit_id: 0,
    produit_name: '',
    variete_id: 0,
    variete_name: '',
    saison_id: 0,
    saison_name: '',
    annne_id: 0,
    annee_name: '',
  );

  /// factory.
  factory ExploitationObject.fromJson(Map<String, dynamic> json) =>
      _$ExploitationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$ExploitationObjectToJson(this);
}

/* ------------------------ ChargeExploitationObject --------------------------- */
List<ExploitationChargeExploitationObject>
    ExploitationChargeExploitationObjectFromJson(String str) =>
        List<ExploitationChargeExploitationObject>.from(json
            .decode(str)
            .map((x) => ExploitationChargeExploitationObject.fromJson(x)));

@JsonSerializable()
@Entity()
class ExploitationChargeExploitationObject {
  @Id(assignable: true)
  int id;
  DateTime date;
  String unite;
  double pu;
  double quantite;
  double valeur;
  String? observation;
  int charge_exploitation_id;
  String charge_exploitation_name;
  int type_charge_exploitation_id;
  String type_charge_exploitation_name;
  int famille_exploitation_id;
  String famille_charge_exploitation_name;
  int exploitation_id;

  ExploitationChargeExploitationObject({
    required this.id,
    required this.date,
    required this.unite,
    required this.pu,
    required this.quantite,
    required this.valeur,
    required this.observation,
    required this.charge_exploitation_id,
    required this.charge_exploitation_name,
    required this.type_charge_exploitation_id,
    required this.type_charge_exploitation_name,
    required this.famille_exploitation_id,
    required this.famille_charge_exploitation_name,
    required this.exploitation_id,
  });

  /// factory.
  factory ExploitationChargeExploitationObject.fromJson(
          Map<String, dynamic> json) =>
      _$ExploitationChargeExploitationObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() =>
      _$ExploitationChargeExploitationObjectToJson(this);
}

/* ------------------------ ProducteurObject --------------------------- */
List<ProducteurObject> ProducteurObjectFromJson(String str) =>
    List<ProducteurObject>.from(
        json.decode(str).map((x) => ProducteurObject.fromJson(x)));

@JsonSerializable()
@Entity()
class ProducteurObject {
  @Id(assignable: true)
  int id;
  String? prenom;
  String? nom;
  String? cni;
  String? email;
  int? op_id;
  String? op_name;
  int? type_op_id;
  String? type_op_name;
  bool is_actif;

  ProducteurObject(
      {required this.id,
      required this.prenom,
      required this.email,
      required this.nom,
      required this.cni,
      required this.op_id,
      required this.op_name,
      required this.type_op_id,
      required this.type_op_name,
      required this.is_actif});

  /// factory.
  factory ProducteurObject.fromJson(Map<String, dynamic> json) =>
      _$ProducteurObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$ProducteurObjectToJson(this);
}

/* ------------------------ OpObject --------------------------- */
List<OpObject> OpObjectFromJson(String str) =>
    List<OpObject>.from(json.decode(str).map((x) => OpObject.fromJson(x)));

@JsonSerializable()
@Entity()
class OpObject {
  @Id(assignable: true)
  int id;
  String name;
  String? email;
  String? telephone;
  String? adresse;
  bool is_actif;
  int type_op_id;
  String type_op_name;
  int? localite_id;
  String? localite_name;
  int? sous_zone_id;
  String? sous_zone_name;
  int? zone_id;
  String? zone_name;
  int? departement_id;
  String? departement_name;
  int? region_id;
  String? region_name;
  int? pays_id;
  String? pays_name;

  OpObject({
    required this.id,
    required this.name,
    required this.email,
    required this.telephone,
    required this.adresse,
    required this.is_actif,
    required this.type_op_id,
    required this.type_op_name,
    required this.localite_id,
    required this.localite_name,
    required this.sous_zone_id,
    required this.sous_zone_name,
    required this.zone_id,
    required this.zone_name,
    required this.departement_id,
    required this.departement_name,
    required this.region_id,
    required this.region_name,
    required this.pays_id,
    required this.pays_name,
  });

  /// factory.
  factory OpObject.fromJson(Map<String, dynamic> json) =>
      _$OpObjectFromJson(json);

  /// Connect the generated
  Map<String, dynamic> toJson() => _$OpObjectToJson(this);
}
