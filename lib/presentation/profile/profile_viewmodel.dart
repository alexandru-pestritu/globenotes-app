import 'package:globenotes/domain/usecase/user/get_user_profile_usecase.dart';
import 'package:globenotes/domain/usecase/user/logout_usecase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/presentation/base/base_viewmodel.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';

class ProfileViewModel extends BaseViewModel
    with ProfileViewModelInputs, ProfileViewModelOutputs {
  final GetUserProfileUseCase _getUserProfileUseCase;
  final LogoutUseCase _logoutUseCase;

  final BehaviorSubject<UserProfile?> _profileSubject =
      BehaviorSubject<UserProfile?>();

  ProfileViewModel(this._getUserProfileUseCase, this._logoutUseCase);

  @override
  void start() {
    fetchUserProfile();
  }

  @override
  void dispose() {
    _profileSubject.close();
    super.dispose();
  }

  @override
  void fetchUserProfile() async {
    inputState.add(LoadingState());

    final result = await _getUserProfileUseCase.execute(null);
    result.fold(
      (failure) {
        inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message),
        );
        _profileSubject.add(null);
      },
      (profile) {
        inputState.add(ContentState());
        _profileSubject.add(profile);
      },
    );
  }

  @override
  void logout() async {
    final result = await _logoutUseCase.execute(null);
    result.fold(
      (failure) {
        inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message),
        );
      },
      (isLoggedOut) {
        inputState.add(ContentState());
      },
    );
  }

  @override
  ValueStream<UserProfile?> get outputUserProfile => _profileSubject.stream;
}

mixin ProfileViewModelInputs {
  void fetchUserProfile();
  void logout();
}

mixin ProfileViewModelOutputs {
  ValueStream<UserProfile?> get outputUserProfile;
}
