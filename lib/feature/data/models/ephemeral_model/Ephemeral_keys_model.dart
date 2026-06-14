import 'AssociatedObjects.dart';

/// id : "ephkey_1TiFEa2ZH6GurWOyAi7ggGrN"
/// object : "ephemeral_key"
/// associated_objects : [{"id":"cus_UheDlBCokTh6bo","type":"customer"}]
/// created : 1781448120
/// expires : 1781451720
/// livemode : false
/// secret : "ek_test_YWNjdF8xVGh1TkUyWkg2R3VyV095LEtYbGdYUE5RNjNHcjFvQmxuWVA0Q1Fnb05STUFqa0E_00nmnaXjAt"

class EphemeralKeysModel {
  EphemeralKeysModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  EphemeralKeysModel.fromJson(dynamic json) {
    id = json['id'];
    object = json['object'];
    if (json['associated_objects'] != null) {
      associatedObjects = [];
      json['associated_objects'].forEach((v) {
        associatedObjects?.add(AssociatedObjects.fromJson(v));
      });
    }
    created = json['created'];
    expires = json['expires'];
    livemode = json['livemode'];
    secret = json['secret'];
  }

  String? id;
  String? object;
  List<AssociatedObjects>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['object'] = object;
    if (associatedObjects != null) {
      map['associated_objects'] = associatedObjects
          ?.map((v) => v.toJson())
          .toList();
    }
    map['created'] = created;
    map['expires'] = expires;
    map['livemode'] = livemode;
    map['secret'] = secret;
    return map;
  }
}
