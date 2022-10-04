// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objectBoxModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserObject _$UserObjectFromJson(Map<String, dynamic> json) => UserObject(
      id: json['id'] as int,
      token: json['token'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      profil_id: json['profil_id'] as int?,
      producteur_id: json['producteur_id'] as int?,
      producteur_prenom: json['producteur_prenom'] as String?,
      producteur_nom: json['producteur_nom'] as String?,
      producteur_cni: json['producteur_cni'] as String?,
      profil_name: json['profil_name'] as String?,
      op_id: json['op_id'] as int?,
      op_name: json['op_name'] as String?,
      sous_zone_id: json['sous_zone_id'] as int?,
      sous_zone_name: json['sous_zone_name'] as String?,
      zone_id: json['zone_id'] as int?,
      zone_name: json['zone_name'] as String?,
    );

Map<String, dynamic> _$UserObjectToJson(UserObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'email': instance.email,
      'password': instance.password,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'profil_id': instance.profil_id,
      'profil_name': instance.profil_name,
      'producteur_id': instance.producteur_id,
      'producteur_prenom': instance.producteur_prenom,
      'producteur_nom': instance.producteur_nom,
      'producteur_cni': instance.producteur_cni,
      'op_id': instance.op_id,
      'op_name': instance.op_name,
      'sous_zone_id': instance.sous_zone_id,
      'sous_zone_name': instance.sous_zone_name,
      'zone_id': instance.zone_id,
      'zone_name': instance.zone_name,
    };

SaisonObject _$SaisonObjectFromJson(Map<String, dynamic> json) => SaisonObject(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$SaisonObjectToJson(SaisonObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

VarieteObject _$VarieteObjectFromJson(Map<String, dynamic> json) =>
    VarieteObject(
      id: json['id'] as int,
      name: json['name'] as String,
      surface_unite: json['surface_unite'] as String?,
      quantite_unite: json['quantite_unite'] as String?,
      rendement_unite: (json['rendement_unite'] as num?)?.toDouble(),
      produit_id: json['produit_id'] as int,
      produit_name: json['produit_name'] as String,
      filiere_id: json['filiere_id'] as int,
      filiere_name: json['filiere_name'] as String,
      familleemplacement_id: json['familleemplacement_id'] as int,
      familleemplacement_name: json['familleemplacement_name'] as String,
    );

Map<String, dynamic> _$VarieteObjectToJson(VarieteObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surface_unite': instance.surface_unite,
      'quantite_unite': instance.quantite_unite,
      'rendement_unite': instance.rendement_unite,
      'produit_id': instance.produit_id,
      'produit_name': instance.produit_name,
      'filiere_id': instance.filiere_id,
      'filiere_name': instance.filiere_name,
      'familleemplacement_id': instance.familleemplacement_id,
      'familleemplacement_name': instance.familleemplacement_name,
    };

FamilleChargeExploitationObject _$FamilleChargeExploitationObjectFromJson(
        Map<String, dynamic> json) =>
    FamilleChargeExploitationObject(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$FamilleChargeExploitationObjectToJson(
        FamilleChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TypeOpObject _$TypeOpObjectFromJson(Map<String, dynamic> json) => TypeOpObject(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$TypeOpObjectToJson(TypeOpObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ChargeExploitationObject _$ChargeExploitationObjectFromJson(
        Map<String, dynamic> json) =>
    ChargeExploitationObject(
      id: json['id'] as int,
      name: json['name'] as String,
      unite: json['unite'] as String,
      pu: (json['pu'] as num).toDouble(),
      quantite_unite_superficie:
          (json['quantite_unite_superficie'] as num).toDouble(),
      produit_id: json['produit_id'] as int,
      produit_name: json['produit_name'] as String,
      famille_charge_exploitation_id:
          json['famille_charge_exploitation_id'] as int,
      famille_charge_exploitation_name:
          json['famille_charge_exploitation_name'] as String,
      type_charge_exploitation_id: json['type_charge_exploitation_id'] as int,
      type_charge_exploitation_name:
          json['type_charge_exploitation_name'] as String,
      isAchat: json['isAchat'] as bool,
    );

Map<String, dynamic> _$ChargeExploitationObjectToJson(
        ChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unite': instance.unite,
      'pu': instance.pu,
      'quantite_unite_superficie': instance.quantite_unite_superficie,
      'produit_id': instance.produit_id,
      'produit_name': instance.produit_name,
      'famille_charge_exploitation_id': instance.famille_charge_exploitation_id,
      'famille_charge_exploitation_name':
          instance.famille_charge_exploitation_name,
      'type_charge_exploitation_id': instance.type_charge_exploitation_id,
      'type_charge_exploitation_name': instance.type_charge_exploitation_name,
      'isAchat': instance.isAchat,
    };

ExploitationObject _$ExploitationObjectFromJson(Map<String, dynamic> json) =>
    ExploitationObject(
      id: json['id'] as int,
      producteur_id: json['producteur_id'] as int,
      prenom: json['prenom'] as String,
      nom: json['nom'] as String,
      cni: json['cni'] as String,
      email: json['email'] as String,
      is_actif: json['is_actif'] as bool,
      op_id: json['op_id'] as int,
      op_name: json['op_name'] as String,
      type_op_id: json['type_op_id'] as int,
      type_op_name: json['type_op_name'] as String,
      exploitation_id: json['exploitation_id'] as int,
      compte: json['compte'] as String,
      unite: json['unite'] as String,
      production_prevision: (json['production_prevision'] as num).toDouble(),
      superficie_prevision: (json['superficie_prevision'] as num).toDouble(),
      pu_prevision: (json['pu_prevision'] as num).toDouble(),
      variete_prevision_id: json['variete_prevision_id'] as int,
      variete_prevision_name: json['variete_prevision_name'] as String,
      produit_prevision_id: json['produit_prevision_id'] as int,
      produit_prevision_name: json['produit_prevision_name'] as String,
      filiere_prevision_id: json['filiere_prevision_id'] as int,
      filiere_prevision_name: json['filiere_prevision_name'] as String,
      production: (json['production'] as num).toDouble(),
      superficie: (json['superficie'] as num).toDouble(),
      pu: (json['pu'] as num).toDouble(),
      variete_id: json['variete_id'] as int,
      variete_name: json['variete_name'] as String,
      produit_id: json['produit_id'] as int,
      produit_name: json['produit_name'] as String,
      filiere_id: json['filiere_id'] as int,
      filiere_name: json['filiere_name'] as String,
      annne_id: json['annne_id'] as int,
      annee_name: json['annee_name'] as String,
      saison_id: json['saison_id'] as int,
      saison_name: json['saison_name'] as String,
    );

Map<String, dynamic> _$ExploitationObjectToJson(ExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'producteur_id': instance.producteur_id,
      'prenom': instance.prenom,
      'nom': instance.nom,
      'cni': instance.cni,
      'email': instance.email,
      'is_actif': instance.is_actif,
      'op_id': instance.op_id,
      'op_name': instance.op_name,
      'type_op_id': instance.type_op_id,
      'type_op_name': instance.type_op_name,
      'exploitation_id': instance.exploitation_id,
      'compte': instance.compte,
      'unite': instance.unite,
      'production_prevision': instance.production_prevision,
      'superficie_prevision': instance.superficie_prevision,
      'pu_prevision': instance.pu_prevision,
      'variete_prevision_id': instance.variete_prevision_id,
      'variete_prevision_name': instance.variete_prevision_name,
      'produit_prevision_id': instance.produit_prevision_id,
      'produit_prevision_name': instance.produit_prevision_name,
      'filiere_prevision_id': instance.filiere_prevision_id,
      'filiere_prevision_name': instance.filiere_prevision_name,
      'production': instance.production,
      'superficie': instance.superficie,
      'pu': instance.pu,
      'variete_id': instance.variete_id,
      'variete_name': instance.variete_name,
      'produit_id': instance.produit_id,
      'produit_name': instance.produit_name,
      'filiere_id': instance.filiere_id,
      'filiere_name': instance.filiere_name,
      'annne_id': instance.annne_id,
      'annee_name': instance.annee_name,
      'saison_id': instance.saison_id,
      'saison_name': instance.saison_name,
    };

ExploitationChargeExploitationObject
    _$ExploitationChargeExploitationObjectFromJson(Map<String, dynamic> json) =>
        ExploitationChargeExploitationObject(
          id: json['id'] as int,
          date: DateTime.parse(json['date'] as String),
          unite: json['unite'] as String,
          pu: (json['pu'] as num).toDouble(),
          quantite: (json['quantite'] as num).toDouble(),
          valeur: (json['valeur'] as num).toDouble(),
          observation: json['observation'] as String?,
          charge_exploitation_id: json['charge_exploitation_id'] as int,
          charge_exploitation_name: json['charge_exploitation_name'] as String,
          type_charge_exploitation_id:
              json['type_charge_exploitation_id'] as int,
          type_charge_exploitation_name:
              json['type_charge_exploitation_name'] as String,
          famille_exploitation_id: json['famille_exploitation_id'] as int,
          famille_charge_exploitation_name:
              json['famille_charge_exploitation_name'] as String,
          exploitation_id: json['exploitation_id'] as int,
        );

Map<String, dynamic> _$ExploitationChargeExploitationObjectToJson(
        ExploitationChargeExploitationObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'unite': instance.unite,
      'pu': instance.pu,
      'quantite': instance.quantite,
      'valeur': instance.valeur,
      'observation': instance.observation,
      'charge_exploitation_id': instance.charge_exploitation_id,
      'charge_exploitation_name': instance.charge_exploitation_name,
      'type_charge_exploitation_id': instance.type_charge_exploitation_id,
      'type_charge_exploitation_name': instance.type_charge_exploitation_name,
      'famille_exploitation_id': instance.famille_exploitation_id,
      'famille_charge_exploitation_name':
          instance.famille_charge_exploitation_name,
      'exploitation_id': instance.exploitation_id,
    };

ProducteurObject _$ProducteurObjectFromJson(Map<String, dynamic> json) =>
    ProducteurObject(
      id: json['id'] as int,
      prenom: json['prenom'] as String?,
      email: json['email'] as String?,
      nom: json['nom'] as String?,
      cni: json['cni'] as String?,
      op_id: json['op_id'] as int?,
      op_name: json['op_name'] as String?,
      type_op_id: json['type_op_id'] as int?,
      type_op_name: json['type_op_name'] as String?,
      is_actif: json['is_actif'] as bool,
    );

Map<String, dynamic> _$ProducteurObjectToJson(ProducteurObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prenom': instance.prenom,
      'nom': instance.nom,
      'cni': instance.cni,
      'email': instance.email,
      'op_id': instance.op_id,
      'op_name': instance.op_name,
      'type_op_id': instance.type_op_id,
      'type_op_name': instance.type_op_name,
      'is_actif': instance.is_actif,
    };

OpObject _$OpObjectFromJson(Map<String, dynamic> json) => OpObject(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String?,
      telephone: json['telephone'] as String?,
      adresse: json['adresse'] as String?,
      is_actif: json['is_actif'] as bool,
      type_op_id: json['type_op_id'] as int,
      type_op_name: json['type_op_name'] as String,
      localite_id: json['localite_id'] as int?,
      localite_name: json['localite_name'] as String?,
      sous_zone_id: json['sous_zone_id'] as int?,
      sous_zone_name: json['sous_zone_name'] as String?,
      zone_id: json['zone_id'] as int?,
      zone_name: json['zone_name'] as String?,
      departement_id: json['departement_id'] as int?,
      departement_name: json['departement_name'] as String?,
      region_id: json['region_id'] as int?,
      region_name: json['region_name'] as String?,
      pays_id: json['pays_id'] as int?,
      pays_name: json['pays_name'] as String?,
    );

Map<String, dynamic> _$OpObjectToJson(OpObject instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'telephone': instance.telephone,
      'adresse': instance.adresse,
      'is_actif': instance.is_actif,
      'type_op_id': instance.type_op_id,
      'type_op_name': instance.type_op_name,
      'localite_id': instance.localite_id,
      'localite_name': instance.localite_name,
      'sous_zone_id': instance.sous_zone_id,
      'sous_zone_name': instance.sous_zone_name,
      'zone_id': instance.zone_id,
      'zone_name': instance.zone_name,
      'departement_id': instance.departement_id,
      'departement_name': instance.departement_name,
      'region_id': instance.region_id,
      'region_name': instance.region_name,
      'pays_id': instance.pays_id,
      'pays_name': instance.pays_name,
    };
