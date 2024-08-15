class Attributes {
  String? id;
  String? name;
  String? type;
  String? handle;
  List<Values>? values;

  Attributes({this.id, this.name, this.type, this.handle, this.values});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    handle = json['handle'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['handle'] = handle;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? value;
  int? rank;

  Values({this.id, this.createdAt, this.updatedAt, this.value, this.rank});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    value = json['value'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['value'] = value;
    data['rank'] = rank;
    return data;
  }
}
