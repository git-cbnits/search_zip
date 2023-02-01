import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/search_zip/repository/i_zip_serch_repository.dart';

part 'search_zip_bloc.freezed.dart';
part 'search_zip_event.dart';
part 'search_zip_state.dart';

class SearchZipBloc extends Bloc<SearchZipEvent,SearchZipState>{

  final ISearchZipRepository iSearchZipRepository;

  SearchZipBloc({required this.iSearchZipRepository}):super(SearchZipState.initial()){
    on<SearchZipEvent>(_onEvent);
  }

  Future<void> _onEvent(SearchZipEvent event, Emitter<SearchZipState> emit)async{
    await event.map(
      initialized: (e) async => emit(SearchZipState.initial()),
      fetch: (e)async{
        emit(state.copyWith(isSearching: true));
        List<String> res = await iSearchZipRepository.search(zipCode: e.zipCode);
        emit(state.copyWith(isSearching: true,result: res));
      },
    );
  }

}