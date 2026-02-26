// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _InvalidEmailFormat value)?  invalidEmailFormat,TResult Function( _InvalidPasswordFormat value)?  invalidPasswordFormat,TResult Function( _WrongPassword value)?  wrongPassword,TResult Function( _NetworkError value)?  networkError,TResult Function( _TooManyAttempts value)?  tooManyAttempts,TResult Function( _OperationNotAllowed value)?  operationNotAllowed,TResult Function( _UserDisabled value)?  userDisabled,TResult Function( _UserNotFound value)?  userNotFound,TResult Function( _Unknown value)?  unknown,TResult Function( _InvalidLoginCredentials value)?  invalidLoginCredentials,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _InvalidEmailFormat() when invalidEmailFormat != null:
return invalidEmailFormat(_that);case _InvalidPasswordFormat() when invalidPasswordFormat != null:
return invalidPasswordFormat(_that);case _WrongPassword() when wrongPassword != null:
return wrongPassword(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _TooManyAttempts() when tooManyAttempts != null:
return tooManyAttempts(_that);case _OperationNotAllowed() when operationNotAllowed != null:
return operationNotAllowed(_that);case _UserDisabled() when userDisabled != null:
return userDisabled(_that);case _UserNotFound() when userNotFound != null:
return userNotFound(_that);case _Unknown() when unknown != null:
return unknown(_that);case _InvalidLoginCredentials() when invalidLoginCredentials != null:
return invalidLoginCredentials(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _InvalidEmailFormat value)  invalidEmailFormat,required TResult Function( _InvalidPasswordFormat value)  invalidPasswordFormat,required TResult Function( _WrongPassword value)  wrongPassword,required TResult Function( _NetworkError value)  networkError,required TResult Function( _TooManyAttempts value)  tooManyAttempts,required TResult Function( _OperationNotAllowed value)  operationNotAllowed,required TResult Function( _UserDisabled value)  userDisabled,required TResult Function( _UserNotFound value)  userNotFound,required TResult Function( _Unknown value)  unknown,required TResult Function( _InvalidLoginCredentials value)  invalidLoginCredentials,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _InvalidEmailFormat():
return invalidEmailFormat(_that);case _InvalidPasswordFormat():
return invalidPasswordFormat(_that);case _WrongPassword():
return wrongPassword(_that);case _NetworkError():
return networkError(_that);case _TooManyAttempts():
return tooManyAttempts(_that);case _OperationNotAllowed():
return operationNotAllowed(_that);case _UserDisabled():
return userDisabled(_that);case _UserNotFound():
return userNotFound(_that);case _Unknown():
return unknown(_that);case _InvalidLoginCredentials():
return invalidLoginCredentials(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _InvalidEmailFormat value)?  invalidEmailFormat,TResult? Function( _InvalidPasswordFormat value)?  invalidPasswordFormat,TResult? Function( _WrongPassword value)?  wrongPassword,TResult? Function( _NetworkError value)?  networkError,TResult? Function( _TooManyAttempts value)?  tooManyAttempts,TResult? Function( _OperationNotAllowed value)?  operationNotAllowed,TResult? Function( _UserDisabled value)?  userDisabled,TResult? Function( _UserNotFound value)?  userNotFound,TResult? Function( _Unknown value)?  unknown,TResult? Function( _InvalidLoginCredentials value)?  invalidLoginCredentials,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _InvalidEmailFormat() when invalidEmailFormat != null:
return invalidEmailFormat(_that);case _InvalidPasswordFormat() when invalidPasswordFormat != null:
return invalidPasswordFormat(_that);case _WrongPassword() when wrongPassword != null:
return wrongPassword(_that);case _NetworkError() when networkError != null:
return networkError(_that);case _TooManyAttempts() when tooManyAttempts != null:
return tooManyAttempts(_that);case _OperationNotAllowed() when operationNotAllowed != null:
return operationNotAllowed(_that);case _UserDisabled() when userDisabled != null:
return userDisabled(_that);case _UserNotFound() when userNotFound != null:
return userNotFound(_that);case _Unknown() when unknown != null:
return unknown(_that);case _InvalidLoginCredentials() when invalidLoginCredentials != null:
return invalidLoginCredentials(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function()?  invalidEmailFormat,TResult Function()?  invalidPasswordFormat,TResult Function()?  wrongPassword,TResult Function()?  networkError,TResult Function()?  tooManyAttempts,TResult Function()?  operationNotAllowed,TResult Function()?  userDisabled,TResult Function()?  userNotFound,TResult Function()?  unknown,TResult Function()?  invalidLoginCredentials,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _InvalidEmailFormat() when invalidEmailFormat != null:
return invalidEmailFormat();case _InvalidPasswordFormat() when invalidPasswordFormat != null:
return invalidPasswordFormat();case _WrongPassword() when wrongPassword != null:
return wrongPassword();case _NetworkError() when networkError != null:
return networkError();case _TooManyAttempts() when tooManyAttempts != null:
return tooManyAttempts();case _OperationNotAllowed() when operationNotAllowed != null:
return operationNotAllowed();case _UserDisabled() when userDisabled != null:
return userDisabled();case _UserNotFound() when userNotFound != null:
return userNotFound();case _Unknown() when unknown != null:
return unknown();case _InvalidLoginCredentials() when invalidLoginCredentials != null:
return invalidLoginCredentials();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function()  invalidEmailFormat,required TResult Function()  invalidPasswordFormat,required TResult Function()  wrongPassword,required TResult Function()  networkError,required TResult Function()  tooManyAttempts,required TResult Function()  operationNotAllowed,required TResult Function()  userDisabled,required TResult Function()  userNotFound,required TResult Function()  unknown,required TResult Function()  invalidLoginCredentials,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success();case _InvalidEmailFormat():
return invalidEmailFormat();case _InvalidPasswordFormat():
return invalidPasswordFormat();case _WrongPassword():
return wrongPassword();case _NetworkError():
return networkError();case _TooManyAttempts():
return tooManyAttempts();case _OperationNotAllowed():
return operationNotAllowed();case _UserDisabled():
return userDisabled();case _UserNotFound():
return userNotFound();case _Unknown():
return unknown();case _InvalidLoginCredentials():
return invalidLoginCredentials();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function()?  invalidEmailFormat,TResult? Function()?  invalidPasswordFormat,TResult? Function()?  wrongPassword,TResult? Function()?  networkError,TResult? Function()?  tooManyAttempts,TResult? Function()?  operationNotAllowed,TResult? Function()?  userDisabled,TResult? Function()?  userNotFound,TResult? Function()?  unknown,TResult? Function()?  invalidLoginCredentials,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success();case _InvalidEmailFormat() when invalidEmailFormat != null:
return invalidEmailFormat();case _InvalidPasswordFormat() when invalidPasswordFormat != null:
return invalidPasswordFormat();case _WrongPassword() when wrongPassword != null:
return wrongPassword();case _NetworkError() when networkError != null:
return networkError();case _TooManyAttempts() when tooManyAttempts != null:
return tooManyAttempts();case _OperationNotAllowed() when operationNotAllowed != null:
return operationNotAllowed();case _UserDisabled() when userDisabled != null:
return userDisabled();case _UserNotFound() when userNotFound != null:
return userNotFound();case _Unknown() when unknown != null:
return unknown();case _InvalidLoginCredentials() when invalidLoginCredentials != null:
return invalidLoginCredentials();case _:
  return null;

}
}

}

/// @nodoc


class _Initial with DiagnosticableTreeMixin implements LoginState {
  const _Initial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.initial()';
}


}




/// @nodoc


class _Loading with DiagnosticableTreeMixin implements LoginState {
  const _Loading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.loading()';
}


}




/// @nodoc


class _Success with DiagnosticableTreeMixin implements LoginState {
  const _Success();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.success'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.success()';
}


}




/// @nodoc


class _InvalidEmailFormat with DiagnosticableTreeMixin implements LoginState {
  const _InvalidEmailFormat();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.invalidEmailFormat'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidEmailFormat);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.invalidEmailFormat()';
}


}




/// @nodoc


class _InvalidPasswordFormat with DiagnosticableTreeMixin implements LoginState {
  const _InvalidPasswordFormat();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.invalidPasswordFormat'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidPasswordFormat);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.invalidPasswordFormat()';
}


}




/// @nodoc


class _WrongPassword with DiagnosticableTreeMixin implements LoginState {
  const _WrongPassword();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.wrongPassword'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WrongPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.wrongPassword()';
}


}




/// @nodoc


class _NetworkError with DiagnosticableTreeMixin implements LoginState {
  const _NetworkError();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.networkError'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.networkError()';
}


}




/// @nodoc


class _TooManyAttempts with DiagnosticableTreeMixin implements LoginState {
  const _TooManyAttempts();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.tooManyAttempts'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TooManyAttempts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.tooManyAttempts()';
}


}




/// @nodoc


class _OperationNotAllowed with DiagnosticableTreeMixin implements LoginState {
  const _OperationNotAllowed();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.operationNotAllowed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationNotAllowed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.operationNotAllowed()';
}


}




/// @nodoc


class _UserDisabled with DiagnosticableTreeMixin implements LoginState {
  const _UserDisabled();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.userDisabled'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDisabled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.userDisabled()';
}


}




/// @nodoc


class _UserNotFound with DiagnosticableTreeMixin implements LoginState {
  const _UserNotFound();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.userNotFound'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.userNotFound()';
}


}




/// @nodoc


class _Unknown with DiagnosticableTreeMixin implements LoginState {
  const _Unknown();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.unknown'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.unknown()';
}


}




/// @nodoc


class _InvalidLoginCredentials with DiagnosticableTreeMixin implements LoginState {
  const _InvalidLoginCredentials();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginState.invalidLoginCredentials'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidLoginCredentials);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginState.invalidLoginCredentials()';
}


}




// dart format on
