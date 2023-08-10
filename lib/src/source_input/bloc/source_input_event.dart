part of 'source_input_bloc.dart';

@immutable
abstract class SourceInputEvent {
  const SourceInputEvent();
}

class SourceInputChanged extends SourceInputEvent {
  final String source;

  const SourceInputChanged({required this.source});
}

class SourceInputSubmit extends SourceInputEvent {
  const SourceInputSubmit();
}
