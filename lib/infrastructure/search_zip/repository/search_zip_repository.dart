import 'package:search_zip/domain/search_zip/repository/i_zip_serch_repository.dart';

import '../datasource/search_zip_remote.dart';

class SearchZipRepository implements ISearchZipRepository{
  final SearchZipRemoteDataSource searchZipRemoteDataSource;

  SearchZipRepository({required this.searchZipRemoteDataSource});

  @override
  Future<List<String>> search({required String zipCode})async{
    List<String> response = await searchZipRemoteDataSource.search(zipCode);
    return response;
  }

}