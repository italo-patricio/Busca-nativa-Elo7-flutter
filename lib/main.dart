import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'src/blocs/ProductServiceBloc.dart';
import 'src/pages/HomePage.dart';

void main() => runApp(MaterialAppPage());



class MaterialAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i)=> ProductServiceBloc())
      ],
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          primaryColor: Color(0xffFE0061)
        ),
      ),
    );
  }
}

