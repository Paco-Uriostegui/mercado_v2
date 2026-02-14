// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Authenticated value)?  authenticated,TResult Function( _AuthenticatedUnverified value)?  authenticatedUnverified,TResult Function( _NotAuthenticated value)?  notAuthenticated,TResult Function( _Loading value)?  loading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Authenticated() when authenticated != null:
return authenticated(_that);case _AuthenticatedUnverified() when authenticatedUnverified != null:
return authenticatedUnverified(_that);case _NotAuthenticated() when notAuthenticated != null:
return notAuthenticated(_that);case _Loading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Authenticated value)  authenticated,required TResult Function( _AuthenticatedUnverified value)  authenticatedUnverified,required TResult Function( _NotAuthenticated value)  notAuthenticated,required TResult Function( _Loading value)  loading,}){
final _that = this;
switch (_that) {
case _Authenticated():
return authenticated(_that);case _AuthenticatedUnverified():
return authenticatedUnverified(_that);case _NotAuthenticated():
return notAuthenticated(_that);case _Loading():
return loading(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Authenticated value)?  authenticated,TResult? Function( _AuthenticatedUnverified value)?  authenticatedUnverified,TResult? Function( _NotAuthenticated value)?  notAuthenticated,TResult? Function( _Loading value)?  loading,}){
final _that = this;
switch (_that) {
case _Authenticated() when authenticated != null:
return authenticated(_that);case _AuthenticatedUnverified() when authenticatedUnverified != null:
return authenticatedUnverified(_that);case _NotAuthenticated() when notAuthenticated != null:
return notAuthenticated(_that);case _Loading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  authenticated,TResult Function()?  authenticatedUnverified,TResult Function()?  notAuthenticated,TResult Function()?  loading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Authenticated() when authenticated != null:
return authenticated();case _AuthenticatedUnverified() when authenticatedUnverified != null:
return authenticatedUnverified();case _NotAuthenticated() when notAuthenticated != null:
return notAuthenticated();case _Loading() when loading != null:
return loading();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  authenticated,required TResult Function()  authenticatedUnverified,required TResult Function()  notAuthenticated,required TResult Function()  loading,}) {final _that = this;
switch (_that) {
case _Authenticated():
return authenticated();case _AuthenticatedUnverified():
return authenticatedUnverified();case _NotAuthenticated():
return notAuthenticated();case _Loading():
return loading();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  authenticated,TResult? Function()?  authenticatedUnverified,TResult? Function()?  notAuthenticated,TResult? Function()?  loading,}) {final _that = this;
switch (_that) {
case _Authenticated() when authenticated != null:
return authenticated();case _AuthenticatedUnverified() when authenticatedUnverified != null:
return authenticatedUnverified();case _NotAuthenticated() when notAuthenticated != null:
return notAuthenticated();case _Loading() when loading != null:
return loading();case _:
  return null;

}
}

}

/// @nodoc


class _Authenticated implements AuthState {
  const _Authenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Authenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.authenticated()';
}


}




/// @nodoc


class _AuthenticatedUnverified implements AuthState {
  const _AuthenticatedUnverified();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticatedUnverified);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.authenticatedUnverified()';
}


}




/// @nodoc


class _NotAuthenticated implements AuthState {
  const _NotAuthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotAuthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.notAuthenticated()';
}


}




/// @nodoc


class _Loading implements AuthState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




// dart format on
