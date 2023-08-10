import 'package:bloc/bloc.dart';
import 'package:course_player/src/source_input/models/response_messages_model.dart';
import 'package:course_player/src/source_input/source_input_repository.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as log;
import 'package:meta/meta.dart';

part 'source_input_event.dart';
part 'source_input_state.dart';

class SourceInputBloc extends Bloc<SourceInputEvent, SourceInputState> {
  final SourceInputRepository sourceInputRepository;

  SourceInputBloc({required this.sourceInputRepository})
      : super(const SourceInputInitial()) {
    on<SourceInputChanged>((event, emit) {
      emit(state.copyWith(source: event.source));
    });

    on<SourceInputSubmit>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        final resp = await sourceInputRepository.getMessages(state.source);
        emit(SourceInputUploaded(
          responseMessagesModel: resp,
          isLoading: state.isLoading,
          source: state.source,
        ));
      } on DioException catch (e) {
        final errorMessage = e.message ?? e.toString();
        log.log("Error on getting messages: $errorMessage");
        emit(state.copyWith(errorMessage: errorMessage));
      } finally {
        emit(state.copyWith(isLoading: false));
      }
    });
  }
}
