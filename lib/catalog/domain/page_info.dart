import 'package:flutter/material.dart';

@immutable
class PageInfo {
  final int page;
  final int pages;
  final int total;

  const PageInfo({
    @required this.page,
    @required this.pages,
    @required this.total,
  })  : assert(page != null),
        assert(pages != null),
        assert(total != null);

  get isLastPage => page == pages;

  factory PageInfo.empty() => PageInfo(
    page: 0,
    pages: 0,
    total: 0,
  );

  factory PageInfo.fromJson(json) => PageInfo(
    page: json['page'],
    pages: json['pages'],
    // because in getRecent total is String, but in search it's int
    total: json['total'] is String ? int.parse(json['total']) : json['total'],
  );

  PageInfo nextPage() => PageInfo(
    page: page + 1,
    pages: pages,
    total: total,
  );
}
