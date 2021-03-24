import 'package:dro/application/bag/baglist/baglist_bloc.dart';
import 'package:dro/domain/menu/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './container_injection.dart' as di;

import 'application/bag/orderwidget_bloc.dart';
import 'application/menu/addsub/productaddsub_bloc.dart';
import 'application/menu/home/menu_home_bloc.dart';
import 'application/menu/showSearch/showsearch_bloc.dart';
import 'presentation/menu/screens/home.dart';

// ignore: avoid_void_async
void main() async {
  await di.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ShowsearchBloc>(
        create: (context) => di.sl<ShowsearchBloc>(),
      ),
      BlocProvider<OrderwidgetBloc>(
        create: (context) => di.sl<OrderwidgetBloc>(),
      ),
      BlocProvider<BaglistBloc>(
        create: (context) => di.sl<BaglistBloc>(),
      ),
      BlocProvider<MenuHomeBloc>(
        create: (context) => di.sl<MenuHomeBloc>(),
      ),
      BlocProvider<ProductaddsubBloc>(
        create: (context) => di.sl<ProductaddsubBloc>(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DRO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductHome();
  }
}
