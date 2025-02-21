// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginObject {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
    LoginObject value,
    $Res Function(LoginObject) then,
  ) = _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginObjectImplCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$LoginObjectImplCopyWith(
    _$LoginObjectImpl value,
    $Res Function(_$LoginObjectImpl) then,
  ) = __$$LoginObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginObjectImplCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$LoginObjectImpl>
    implements _$$LoginObjectImplCopyWith<$Res> {
  __$$LoginObjectImplCopyWithImpl(
    _$LoginObjectImpl _value,
    $Res Function(_$LoginObjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$LoginObjectImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                as String,
        null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LoginObjectImpl implements _LoginObject {
  _$LoginObjectImpl(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginObjectImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      __$$LoginObjectImplCopyWithImpl<_$LoginObjectImpl>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String email, final String password) =
      _$LoginObjectImpl;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterObject {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of RegisterObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
    RegisterObject value,
    $Res Function(RegisterObject) then,
  ) = _$RegisterObjectCopyWithImpl<$Res, RegisterObject>;
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res, $Val extends RegisterObject>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterObjectImplCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$$RegisterObjectImplCopyWith(
    _$RegisterObjectImpl value,
    $Res Function(_$RegisterObjectImpl) then,
  ) = __$$RegisterObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class __$$RegisterObjectImplCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res, _$RegisterObjectImpl>
    implements _$$RegisterObjectImplCopyWith<$Res> {
  __$$RegisterObjectImplCopyWithImpl(
    _$RegisterObjectImpl _value,
    $Res Function(_$RegisterObjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(
      _$RegisterObjectImpl(
        null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                as String,
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                as String,
        null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$RegisterObjectImpl implements _RegisterObject {
  _$RegisterObjectImpl(this.name, this.email, this.password);

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterObject(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterObjectImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  /// Create a copy of RegisterObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterObjectImplCopyWith<_$RegisterObjectImpl> get copyWith =>
      __$$RegisterObjectImplCopyWithImpl<_$RegisterObjectImpl>(
        this,
        _$identity,
      );
}

abstract class _RegisterObject implements RegisterObject {
  factory _RegisterObject(
    final String name,
    final String email,
    final String password,
  ) = _$RegisterObjectImpl;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;

  /// Create a copy of RegisterObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterObjectImplCopyWith<_$RegisterObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VerifyEmailObject {
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Create a copy of VerifyEmailObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyEmailObjectCopyWith<VerifyEmailObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEmailObjectCopyWith<$Res> {
  factory $VerifyEmailObjectCopyWith(
    VerifyEmailObject value,
    $Res Function(VerifyEmailObject) then,
  ) = _$VerifyEmailObjectCopyWithImpl<$Res, VerifyEmailObject>;
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class _$VerifyEmailObjectCopyWithImpl<$Res, $Val extends VerifyEmailObject>
    implements $VerifyEmailObjectCopyWith<$Res> {
  _$VerifyEmailObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyEmailObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? code = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            code:
                null == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerifyEmailObjectImplCopyWith<$Res>
    implements $VerifyEmailObjectCopyWith<$Res> {
  factory _$$VerifyEmailObjectImplCopyWith(
    _$VerifyEmailObjectImpl value,
    $Res Function(_$VerifyEmailObjectImpl) then,
  ) = __$$VerifyEmailObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class __$$VerifyEmailObjectImplCopyWithImpl<$Res>
    extends _$VerifyEmailObjectCopyWithImpl<$Res, _$VerifyEmailObjectImpl>
    implements _$$VerifyEmailObjectImplCopyWith<$Res> {
  __$$VerifyEmailObjectImplCopyWithImpl(
    _$VerifyEmailObjectImpl _value,
    $Res Function(_$VerifyEmailObjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifyEmailObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? code = null}) {
    return _then(
      _$VerifyEmailObjectImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                as String,
        null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$VerifyEmailObjectImpl implements _VerifyEmailObject {
  _$VerifyEmailObjectImpl(this.email, this.code);

  @override
  final String email;
  @override
  final String code;

  @override
  String toString() {
    return 'VerifyEmailObject(email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyEmailObjectImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  /// Create a copy of VerifyEmailObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyEmailObjectImplCopyWith<_$VerifyEmailObjectImpl> get copyWith =>
      __$$VerifyEmailObjectImplCopyWithImpl<_$VerifyEmailObjectImpl>(
        this,
        _$identity,
      );
}

abstract class _VerifyEmailObject implements VerifyEmailObject {
  factory _VerifyEmailObject(final String email, final String code) =
      _$VerifyEmailObjectImpl;

  @override
  String get email;
  @override
  String get code;

  /// Create a copy of VerifyEmailObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyEmailObjectImplCopyWith<_$VerifyEmailObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResendVerificationObject {
  String get email => throw _privateConstructorUsedError;

  /// Create a copy of ResendVerificationObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResendVerificationObjectCopyWith<ResendVerificationObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendVerificationObjectCopyWith<$Res> {
  factory $ResendVerificationObjectCopyWith(
    ResendVerificationObject value,
    $Res Function(ResendVerificationObject) then,
  ) = _$ResendVerificationObjectCopyWithImpl<$Res, ResendVerificationObject>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ResendVerificationObjectCopyWithImpl<
  $Res,
  $Val extends ResendVerificationObject
>
    implements $ResendVerificationObjectCopyWith<$Res> {
  _$ResendVerificationObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResendVerificationObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResendVerificationObjectImplCopyWith<$Res>
    implements $ResendVerificationObjectCopyWith<$Res> {
  factory _$$ResendVerificationObjectImplCopyWith(
    _$ResendVerificationObjectImpl value,
    $Res Function(_$ResendVerificationObjectImpl) then,
  ) = __$$ResendVerificationObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ResendVerificationObjectImplCopyWithImpl<$Res>
    extends
        _$ResendVerificationObjectCopyWithImpl<
          $Res,
          _$ResendVerificationObjectImpl
        >
    implements _$$ResendVerificationObjectImplCopyWith<$Res> {
  __$$ResendVerificationObjectImplCopyWithImpl(
    _$ResendVerificationObjectImpl _value,
    $Res Function(_$ResendVerificationObjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResendVerificationObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$ResendVerificationObjectImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ResendVerificationObjectImpl implements _ResendVerificationObject {
  _$ResendVerificationObjectImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'ResendVerificationObject(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendVerificationObjectImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ResendVerificationObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendVerificationObjectImplCopyWith<_$ResendVerificationObjectImpl>
  get copyWith => __$$ResendVerificationObjectImplCopyWithImpl<
    _$ResendVerificationObjectImpl
  >(this, _$identity);
}

abstract class _ResendVerificationObject implements ResendVerificationObject {
  factory _ResendVerificationObject(final String email) =
      _$ResendVerificationObjectImpl;

  @override
  String get email;

  /// Create a copy of ResendVerificationObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResendVerificationObjectImplCopyWith<_$ResendVerificationObjectImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordObject {
  String get email => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordObjectCopyWith<ForgotPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordObjectCopyWith<$Res> {
  factory $ForgotPasswordObjectCopyWith(
    ForgotPasswordObject value,
    $Res Function(ForgotPasswordObject) then,
  ) = _$ForgotPasswordObjectCopyWithImpl<$Res, ForgotPasswordObject>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordObjectCopyWithImpl<
  $Res,
  $Val extends ForgotPasswordObject
>
    implements $ForgotPasswordObjectCopyWith<$Res> {
  _$ForgotPasswordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForgotPasswordObjectImplCopyWith<$Res>
    implements $ForgotPasswordObjectCopyWith<$Res> {
  factory _$$ForgotPasswordObjectImplCopyWith(
    _$ForgotPasswordObjectImpl value,
    $Res Function(_$ForgotPasswordObjectImpl) then,
  ) = __$$ForgotPasswordObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordObjectImplCopyWithImpl<$Res>
    extends _$ForgotPasswordObjectCopyWithImpl<$Res, _$ForgotPasswordObjectImpl>
    implements _$$ForgotPasswordObjectImplCopyWith<$Res> {
  __$$ForgotPasswordObjectImplCopyWithImpl(
    _$ForgotPasswordObjectImpl _value,
    $Res Function(_$ForgotPasswordObjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$ForgotPasswordObjectImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ForgotPasswordObjectImpl implements _ForgotPasswordObject {
  _$ForgotPasswordObjectImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordObject(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordObjectImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordObjectImplCopyWith<_$ForgotPasswordObjectImpl>
  get copyWith =>
      __$$ForgotPasswordObjectImplCopyWithImpl<_$ForgotPasswordObjectImpl>(
        this,
        _$identity,
      );
}

abstract class _ForgotPasswordObject implements ForgotPasswordObject {
  factory _ForgotPasswordObject(final String email) =
      _$ForgotPasswordObjectImpl;

  @override
  String get email;

  /// Create a copy of ForgotPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordObjectImplCopyWith<_$ForgotPasswordObjectImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VerifyForgotPasswordObject {
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Create a copy of VerifyForgotPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyForgotPasswordObjectCopyWith<VerifyForgotPasswordObject>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyForgotPasswordObjectCopyWith<$Res> {
  factory $VerifyForgotPasswordObjectCopyWith(
    VerifyForgotPasswordObject value,
    $Res Function(VerifyForgotPasswordObject) then,
  ) =
      _$VerifyForgotPasswordObjectCopyWithImpl<
        $Res,
        VerifyForgotPasswordObject
      >;
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class _$VerifyForgotPasswordObjectCopyWithImpl<
  $Res,
  $Val extends VerifyForgotPasswordObject
>
    implements $VerifyForgotPasswordObjectCopyWith<$Res> {
  _$VerifyForgotPasswordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyForgotPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? code = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            code:
                null == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerifyForgotPasswordObjectImplCopyWith<$Res>
    implements $VerifyForgotPasswordObjectCopyWith<$Res> {
  factory _$$VerifyForgotPasswordObjectImplCopyWith(
    _$VerifyForgotPasswordObjectImpl value,
    $Res Function(_$VerifyForgotPasswordObjectImpl) then,
  ) = __$$VerifyForgotPasswordObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class __$$VerifyForgotPasswordObjectImplCopyWithImpl<$Res>
    extends
        _$VerifyForgotPasswordObjectCopyWithImpl<
          $Res,
          _$VerifyForgotPasswordObjectImpl
        >
    implements _$$VerifyForgotPasswordObjectImplCopyWith<$Res> {
  __$$VerifyForgotPasswordObjectImplCopyWithImpl(
    _$VerifyForgotPasswordObjectImpl _value,
    $Res Function(_$VerifyForgotPasswordObjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifyForgotPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? code = null}) {
    return _then(
      _$VerifyForgotPasswordObjectImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                as String,
        null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$VerifyForgotPasswordObjectImpl implements _VerifyForgotPasswordObject {
  _$VerifyForgotPasswordObjectImpl(this.email, this.code);

  @override
  final String email;
  @override
  final String code;

  @override
  String toString() {
    return 'VerifyForgotPasswordObject(email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyForgotPasswordObjectImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  /// Create a copy of VerifyForgotPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyForgotPasswordObjectImplCopyWith<_$VerifyForgotPasswordObjectImpl>
  get copyWith => __$$VerifyForgotPasswordObjectImplCopyWithImpl<
    _$VerifyForgotPasswordObjectImpl
  >(this, _$identity);
}

abstract class _VerifyForgotPasswordObject
    implements VerifyForgotPasswordObject {
  factory _VerifyForgotPasswordObject(final String email, final String code) =
      _$VerifyForgotPasswordObjectImpl;

  @override
  String get email;
  @override
  String get code;

  /// Create a copy of VerifyForgotPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyForgotPasswordObjectImplCopyWith<_$VerifyForgotPasswordObjectImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResetPasswordObject {
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  /// Create a copy of ResetPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPasswordObjectCopyWith<ResetPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordObjectCopyWith<$Res> {
  factory $ResetPasswordObjectCopyWith(
    ResetPasswordObject value,
    $Res Function(ResetPasswordObject) then,
  ) = _$ResetPasswordObjectCopyWithImpl<$Res, ResetPasswordObject>;
  @useResult
  $Res call({
    String email,
    String code,
    String password,
    String confirmPassword,
  });
}

/// @nodoc
class _$ResetPasswordObjectCopyWithImpl<$Res, $Val extends ResetPasswordObject>
    implements $ResetPasswordObjectCopyWith<$Res> {
  _$ResetPasswordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            code:
                null == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
            confirmPassword:
                null == confirmPassword
                    ? _value.confirmPassword
                    : confirmPassword // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResetPasswordObjectImplCopyWith<$Res>
    implements $ResetPasswordObjectCopyWith<$Res> {
  factory _$$ResetPasswordObjectImplCopyWith(
    _$ResetPasswordObjectImpl value,
    $Res Function(_$ResetPasswordObjectImpl) then,
  ) = __$$ResetPasswordObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String code,
    String password,
    String confirmPassword,
  });
}

/// @nodoc
class __$$ResetPasswordObjectImplCopyWithImpl<$Res>
    extends _$ResetPasswordObjectCopyWithImpl<$Res, _$ResetPasswordObjectImpl>
    implements _$$ResetPasswordObjectImplCopyWith<$Res> {
  __$$ResetPasswordObjectImplCopyWithImpl(
    _$ResetPasswordObjectImpl _value,
    $Res Function(_$ResetPasswordObjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(
      _$ResetPasswordObjectImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                as String,
        null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                as String,
        null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                as String,
        null == confirmPassword
            ? _value.confirmPassword
            : confirmPassword // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ResetPasswordObjectImpl implements _ResetPasswordObject {
  _$ResetPasswordObjectImpl(
    this.email,
    this.code,
    this.password,
    this.confirmPassword,
  );

  @override
  final String email;
  @override
  final String code;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'ResetPasswordObject(email: $email, code: $code, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordObjectImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, code, password, confirmPassword);

  /// Create a copy of ResetPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordObjectImplCopyWith<_$ResetPasswordObjectImpl> get copyWith =>
      __$$ResetPasswordObjectImplCopyWithImpl<_$ResetPasswordObjectImpl>(
        this,
        _$identity,
      );
}

abstract class _ResetPasswordObject implements ResetPasswordObject {
  factory _ResetPasswordObject(
    final String email,
    final String code,
    final String password,
    final String confirmPassword,
  ) = _$ResetPasswordObjectImpl;

  @override
  String get email;
  @override
  String get code;
  @override
  String get password;
  @override
  String get confirmPassword;

  /// Create a copy of ResetPasswordObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordObjectImplCopyWith<_$ResetPasswordObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
