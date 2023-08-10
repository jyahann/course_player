import 'package:course_player/app_config/colors.dart';
import 'package:course_player/src/components/primary_button/primary_button.dart';
import 'package:course_player/src/lesson/screens/lesson_screen.dart';
import 'package:course_player/src/source_input/bloc/source_input_bloc.dart';
import 'package:course_player/src/source_input/source_input_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SourceInputScreen extends StatelessWidget {
  const SourceInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = SourceInputBloc(
      sourceInputRepository: SourceInputRepository(),
    );
    final controller = TextEditingController();
    return BlocListener<SourceInputBloc, SourceInputState>(
      bloc: bloc,
      listener: (context, state) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => LessonScreen(
              messages:
                  (state as SourceInputUploaded).responseMessagesModel.messages,
            ),
          ),
        );
      },
      listenWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType &&
          current is SourceInputUploaded,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<SourceInputBloc, SourceInputState>(
                bloc: bloc,
                builder: (context, state) {
                  return TextField(
                    onChanged: (value) {
                      bloc.add(SourceInputChanged(source: value));
                    },
                    onSubmitted: (value) {
                      if (bloc.state.source.isNotEmpty &&
                          bloc.state.isLoading) {}
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Введите ссылку",
                      hintStyle: const TextStyle(fontSize: 13),
                      errorText: state.errorMessage.isEmpty
                          ? null
                          : state.errorMessage,
                      errorStyle: const TextStyle(
                        color: errorColor,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 16.0,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    controller: controller,
                    autofocus: true,
                  );
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              BlocBuilder<SourceInputBloc, SourceInputState>(
                bloc: bloc,
                builder: (context, state) {
                  PrimaryButtonState btnState = !state.source.isNotEmpty
                      ? PrimaryButtonState.disabled
                      : PrimaryButtonState.active;
                  if (state.isLoading) {
                    btnState = PrimaryButtonState.loading;
                  }
                  return PrimaryButton(
                    title: "Начать урок",
                    state: btnState,
                    onPressed: () {
                      bloc.add(const SourceInputSubmit());
                    },
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
