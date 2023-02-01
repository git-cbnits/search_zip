part of 'search_zip_bloc.dart';

@freezed
class SearchZipEvent with _$SearchZipEvent{
  const factory SearchZipEvent.initialized() = _Initialized;
  const factory SearchZipEvent.fetch({required String zipCode}) = _Fetch;
}