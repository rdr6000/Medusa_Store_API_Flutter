enum OrderAscDesc { asc, desc }

class StoreGetSearchReq {
  String? q;
  int? offset;
  int? limit;
  int? minPrice = 0;
  OrderAscDesc? order;
  String? orderBy;
  List<String>? categories;

  List<String>? sort = <String>[];
  int? maxPrice = 3000;
  int? page = 1;

  String? currencyCode = 'INR';

  String? highlightPreTag = '__ais-highlight__';
  List<String> attributesToHighlight = <String>["*"];

  String? highlightPostTag = '__/ais-highlight__';


  StoreGetSearchReq(
      {this.q,
      this.offset,
      this.limit,
      this.minPrice = 0,
      this.maxPrice = 3000,
      this.sort,
      this.attributesToHighlight = const <String>["*"],
      this.highlightPreTag = '__ais-highlight__',
      this.categories,
      this.orderBy,
      this.currencyCode = 'INR',
      this.page = 1,
      this.highlightPostTag = '__/ais-highlight__',
      this.order = OrderAscDesc.asc});

  StoreGetSearchReq.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    offset = json['offset'];
    limit = json['limit'];
    orderBy = json['orderBy'];
    sort = json['sort'] != null ? List<String>.from(json['sort']) : <String>[];
    currencyCode = json['currencyCode'];
    page = json['page'];
    maxPrice = json['maxPrice'];
    minPrice = json['minPrice'];
    order = json['order'] == 'asc' ? OrderAscDesc.asc : OrderAscDesc.desc;
    categories = json['categories'] != null
        ? List<String>.from(json['categories'])
        : <String>[];
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
    data['orderBy'] = orderBy;
    data['minPrice'] = minPrice;
    data['sort'] = sort;
    data['currencyCode'] = currencyCode;
    data['maxPrice'] = maxPrice;
    data['page'] = page;
    data['order'] = order == OrderAscDesc.asc ? 'asc' : 'desc';
    data['categories'] = categories;
    data['attributesToHighlight'] = attributesToHighlight;
    data['highlightPreTag'] = highlightPreTag;
    data['highlightPostTag'] = highlightPostTag;
    return data;
  }
}
