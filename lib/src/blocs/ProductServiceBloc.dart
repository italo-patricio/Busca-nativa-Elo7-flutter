import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:elo7_desafio/src/models/PaginatedProductsResult.dart';
import 'package:elo7_desafio/src/services/ProductSearchResult.dart';
import 'package:elo7_desafio/src/services/ProductService.dart';
import 'package:rxdart/rxdart.dart';

class ProductServiceBloc extends BlocBase {
  ProductService _service = ProductService();

  final _searchController = BehaviorSubject<String>();

  Observable<String> get searchFlux => _searchController.stream;

  Sink<String> get searchSink => _searchController.sink;

  Stream<ProductSearchResult> apiResultFlux = BehaviorSubject();
  Stream<PaginatedProductsResult> apiResultPaginated = BehaviorSubject();

  final _productController = BehaviorSubject<ProductSearchResult>();

  Observable<ProductSearchResult> get productsResultOut =>
      _productController.stream;

  Sink<ProductSearchResult> get productResultIn => _productController.sink;

  ProductServiceBloc() {
    apiResultFlux = searchFlux
        .distinct()
        .debounceTime(Duration(milliseconds: 500))
        .asyncMap(_service.search)
        .switchMap((value) => Observable.just(value));


  }

  scrollLoadItem() {
    apiResultPaginated = _service.loadPaginated().asStream();
  }

  // ignore: must_call_super
  void dispose() {
    _searchController?.close();
  }
}
