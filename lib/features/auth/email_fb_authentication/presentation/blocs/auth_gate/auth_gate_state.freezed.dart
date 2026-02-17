// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_gate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthGateState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthGateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthGateState()';
}


}

/// @nodoc
class $AuthGateStateCopyWith<$Res>  {
$AuthGateStateCopyWith(AuthGateState _, $Res Function(AuthGateState) __);
}


/// Adds pattern-matching-related methods to [AuthGateState].
extension AuthGateStatePatterns on AuthGateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _GoToLogin value)?  goToLogin,TResult Function( _GoToVerifyEmail value)?  goToVerifyEmail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _GoToLogin() when goToLogin != null:
return goToLogin(_that);case _GoToVerifyEmail() when goToVerifyEmail != null:
return goToVerifyEmail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _GoToLogin value)  goToLogin,required TResult Function( _GoToVerifyEmail value)  goToVerifyEmail,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _GoToLogin():
return goToLogin(_that);case _GoToVerifyEmail():
return goToVerifyEmail(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _GoToLogin value)?  goToLogin,TResult? Function( _GoToVerifyEmail value)?  goToVerifyEmail,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _GoToLogin() when goToLogin != null:
return goToLogin(_that);case _GoToVerifyEmail() when goToVerifyEmail != null:
return goToVerifyEmail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  goToLogin,TResult Function()?  goToVerifyEmail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _GoToLogin() when goToLogin != null:
return goToLogin();case _GoToVerifyEmail() when goToVerifyEmail != null:
return goToVerifyEmail();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  goToLogin,required TResult Function()  goToVerifyEmail,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _GoToLogin():
return goToLogin();case _GoToVerifyEmail():
return goToVerifyEmail();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  goToLogin,TResult? Function()?  goToVerifyEmail,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _GoToLogin() when goToLogin != null:
return goToLogin();case _GoToVerifyEmail() when goToVerifyEmail != null:
return goToVerifyEmail();case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements AuthGateState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthGateState.loading()';
}


}




/// @nodoc


class _GoToLogin implements AuthGateState {
  const _GoToLogin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToLogin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthGateState.goToLogin()';
}


}




/// @nodoc


class _GoToVerifyEmail implements AuthGateState {
  const _GoToVerifyEmail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToVerifyEmail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthGateState.goToVerifyEmail()';
}


}




// dart format on
