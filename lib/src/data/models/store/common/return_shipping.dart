class ReturnShipping {
  final String? optionId;

  ReturnShipping({this.optionId});

  factory ReturnShipping.fromJson(Map<String, dynamic> json) {
    return ReturnShipping(optionId: json['option_id']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['option_id'] = optionId;
    return json;
  }
}
