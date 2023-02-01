

abstract class ISearchZipRepository{
  Future<List<String>> search({required String zipCode});
}