part of 'search_zip_bloc.dart';

@freezed
class SearchZipState with _$SearchZipState{
  const SearchZipState._();

  const factory SearchZipState({
    required bool isSearching,
    required List<String> result,
  }) = _SearchZipState;

  factory SearchZipState.initial() => const SearchZipState(
    isSearching: false,
    result: [],
  );

}