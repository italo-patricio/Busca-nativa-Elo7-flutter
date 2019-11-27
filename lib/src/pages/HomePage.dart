import 'package:elo7_desafio/src/models/PaginatedProductsResult.dart';
import 'package:elo7_desafio/src/models/Product.dart';
import 'package:elo7_desafio/src/services/ProductSearchResult.dart';
import 'package:elo7_desafio/src/blocs/ProductServiceBloc.dart';
import 'package:flutter/material.dart';

import 'package:elo7_desafio/src/widgets/ProductWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductServiceBloc _productServiceBloc;
  TextEditingController _searchQuery;
  bool _isSearching = false;

  @override
  void initState() {
    _productServiceBloc = ProductServiceBloc();
    _searchQuery = new TextEditingController();
    super.initState();

    _productServiceBloc.searchFlux.listen((onData){
      print(onData);

      setState(() {
        _isSearching = onData.length > 0 ? true : false;
      });
    });

    _productServiceBloc.searchSink.add('');

    _productServiceBloc.scrollLoadItem();
  }

  @override
  void dispose() {
    _productServiceBloc.dispose();
    super.dispose();
  }

  clearSearch() {
    setState(() {
      _isSearching = false;
    });
  }

  _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  Widget _buildSearchField() {
    return new TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Pesquisar...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white70),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: _productServiceBloc.searchSink.add,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchField(),
        actions: <Widget>[

                this._isSearching ?
                  IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      _searchQuery.clear();
                      _productServiceBloc.searchSink.add('');
                    },
                  ) : Container()


        ],
      ),
      body: StreamBuilder<PaginatedProductsResult>(
          stream: _productServiceBloc.apiResultPaginated,
          builder: (BuildContext context,
              AsyncSnapshot<PaginatedProductsResult> snapshot) {
            print('hasData ${snapshot.hasData}');
            return snapshot.hasData
                ? GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    addRepaintBoundaries: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300),
                    itemCount: snapshot.data.result.elements.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product item = snapshot.data.result.elements[index];
                      return ProductWidget(item);
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
