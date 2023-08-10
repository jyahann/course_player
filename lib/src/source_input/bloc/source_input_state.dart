part of 'source_input_bloc.dart';

@immutable
abstract class SourceInputState {
  final bool isLoading;
  final String source;
  final String errorMessage;

  const SourceInputState({
    required this.isLoading,
    required this.source,
    required this.errorMessage,
  });

  SourceInputState copyWith({
    bool? isLoading,
    String? source,
    String? errorMessage,
  });
}

class SourceInputInitial extends SourceInputState {
  const SourceInputInitial({
    bool isLoading = false,
    String source = "",
    String errorMessage = "",
  }) : super(isLoading: isLoading, source: source, errorMessage: errorMessage);

  @override
  SourceInputInitial copyWith({
    bool? isLoading,
    String? source,
    String? errorMessage,
  }) {
    return SourceInputInitial(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      source: source ?? this.source,
    );
  }
}

class SourceInputUploaded extends SourceInputState {
  final ResponseMessagesModel responseMessagesModel;

  const SourceInputUploaded({
    required this.responseMessagesModel,
    String errorMessage = "",
    bool isLoading = false,
    String source = "",
  }) : super(isLoading: isLoading, source: source, errorMessage: errorMessage);

  @override
  SourceInputUploaded copyWith({
    bool? isLoading,
    String? source,
    ResponseMessagesModel? responseMessagesModel,
    String? errorMessage,
  }) {
    return SourceInputUploaded(
      isLoading: isLoading ?? this.isLoading,
      source: source ?? this.source,
      responseMessagesModel:
          responseMessagesModel ?? this.responseMessagesModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
