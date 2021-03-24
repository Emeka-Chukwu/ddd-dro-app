import 'package:dro/application/bag/orderwidget_bloc.dart';
import 'package:dro/application/menu/home/menu_home_bloc.dart';
import 'package:dro/domain/bag/repository.dart';
import 'package:dro/infrastructure/bag/repository_impl.dart';
import 'package:dro/infrastructure/menu/repository_impl.dart';
import 'package:get_it/get_it.dart';

import './domain/menu/repository.dart';
import 'application/bag/baglist/baglist_bloc.dart';
import 'application/menu/addsub/productaddsub_bloc.dart';
import 'application/menu/showSearch/showsearch_bloc.dart';

GetIt sl = GetIt.instance;
Future<void> init() async {
  // bloc
  ///[showSearchBloc ]
  sl.registerFactory(
    () => ShowsearchBloc(
      initialState: sl(),
    ),
  );

  sl.registerFactory(
    () => MenuHomeBloc(
      initialState: sl(),
      repository: sl(),
    ),
  );

  /// [OrderWidgetBloc]
  sl.registerFactory(() => OrderwidgetBloc(initialState: sl()));

  /// [bagListBloc]

  sl.registerFactory(() => BaglistBloc(
        initialState: sl(),
        repository: sl(),
      ));

  // ProductaddsubBloc

  sl.registerFactory(() => ProductaddsubBloc(initialState: sl()));

  /// [State]
  /// showsearch
  sl.registerLazySingleton<ShowsearchState>(() => ShowsearchInitial());

  ///[orderBagWidgets]
  ///bags
  sl.registerLazySingleton<OrderwidgetState>(() => OrderwidgetInitial());

  /// []
  sl.registerLazySingleton<BaglistState>(() => BaglistInitial());

  sl.registerLazySingleton<MenuHomeState>(() => MenuHomeInitial());

  sl.registerLazySingleton<ProductaddsubState>(() => ProductaddsubInitial());

  /// [adding repository for baglist]

  sl.registerLazySingleton<BagRepository>(() => BagRespositoryImpl());
  sl.registerLazySingleton<MenuRespository>(() => MenuRepositoryImpl());
}
