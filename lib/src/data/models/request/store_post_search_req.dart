class StorePostSearchReq {
  String? q;
  int? offset;
  int? limit;

  List<String>? sort = <String>[];

  String? highlightPreTag = '__ais-highlight__';
  List<String> attributesToHighlight = <String>["*"];

  String? highlightPostTag = '__/ais-highlight__';

  dynamic filter;

  StorePostSearchReq(
      {this.q,
      this.offset,
      this.limit,
      this.filter,
      this.sort,
      this.attributesToHighlight = const <String>["*"],
      this.highlightPreTag = '__ais-highlight__',
      this.highlightPostTag = '__/ais-highlight__'});

  StorePostSearchReq.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    offset = json['offset'];
    limit = json['limit'];
    filter = json['filter'];
    sort = json['sort'] != null ? List<String>.from(json['sort']) : <String>[];
    attributesToHighlight = json['attributesToHighlight'] != null
        ? List<String>.from(json['attributesToHighlight'])
        : <String>[];
    highlightPreTag = json['highlightPreTag'];
    highlightPostTag = json['highlightPostTag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['q'] = q;
    data['offset'] = offset;
    data['limit'] = limit;
    data['filter'] = filter;
    data['sort'] = sort;
    data['attributesToHighlight'] = attributesToHighlight;
    data['highlightPreTag'] = highlightPreTag;
    data['highlightPostTag'] = highlightPostTag;
    return data;
  }
}
