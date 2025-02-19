import 'dart:async';

import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel with BaseViewModelInputs, BaseViewModelOutputs {
  final StreamController _inputStateStreamController =
      StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStateStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStateStreamController.close();
  }
}

mixin BaseViewModelInputs {
  void start();
  void dispose();

  Sink get inputState;
}

mixin BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
