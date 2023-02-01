import 'package:get_it/get_it.dart';

import 'application/search_zip/search_zip_bloc.dart';
import 'infrastructure/search_zip/datasource/search_zip_remote.dart';
import 'infrastructure/search_zip/repository/search_zip_repository.dart';



GetIt locator = GetIt.instance;

void setupLocator(){

  locator.registerLazySingleton(() => SearchZipRemoteDataSource());
  locator.registerLazySingleton(() => SearchZipRepository(searchZipRemoteDataSource: locator<SearchZipRemoteDataSource>()));
  locator.registerLazySingleton(() => SearchZipBloc(iSearchZipRepository: locator<SearchZipRepository>()),);

}


