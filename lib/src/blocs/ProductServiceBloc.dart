import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:elo7_desafio/src/services/ProductSearchResult.dart';
import 'package:elo7_desafio/src/services/ProductService.dart';
import 'package:rxdart/rxdart.dart';

class ProductServiceBloc extends BlocBase {

  ProductService _service = ProductService();

  final _searchController = BehaviorSubject<String>();

  Observable<String> get searchFlux => _searchController.stream;
  Sink<String> get searchSink => _searchController.sink;

  Stream<ProductSearchResult> apiResultFlux;

  ProductServiceBloc() {
    apiResultFlux = searchFlux
        .distinct()
        .debounceTime(Duration(milliseconds: 500))
        .asyncMap(_service.search)
        .switchMap((value) => Observable.just(value));
  }

  // ignore: must_call_super
  void dispose() {
    _searchController?.close();
  }


}
