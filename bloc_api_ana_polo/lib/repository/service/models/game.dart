
import 'package:bloc_api_ana_polo/repository/service/models/filters.dart';
import 'package:bloc_api_ana_polo/repository/service/models/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game{

  final int? count;
  final String? next;
  final int? previous;
  final List<Result> results;
  final String? seoTitle;
  final String? seoDescription;
  final String? seoKeywords;
  final String? seoH1;
  final bool? noindex;
  final bool? nofollow;
  final String? description;
  final Filters? filters;
  final List<String>? nofollowCollections;

  const Game({
    this.count,
    this.next,
    this.previous,
    required this.results,
    this.seoTitle,
    this.seoDescription,
    this.seoKeywords,
    this.seoH1,
    this.noindex,
    this.nofollow,
    this.description,
    this.filters,
    this.nofollowCollections,
  });

  static const empty = Game(
    count: 0,
    next: '',
    previous: 0,
    results: [],
    seoTitle: '',
    seoDescription: '',
    seoKeywords: '',
    seoH1: '',
    noindex: false,
    nofollow: false,
    description: '',
    filters: Filters(years: []),
    nofollowCollections: [],
  );

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

}