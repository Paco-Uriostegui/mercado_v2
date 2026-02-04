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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Authorized value)?  authenticated,TResult Function( _NotAuthorized value)?  notAuthenticated,TResult Function( _Loading value)?  loading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Authorized() when authenticated != null:
return authenticated(_that);case _NotAuthorized() when notAuthenticated != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Authorized value)  authenticated,required TResult Function( _NotAuthorized value)  notAuthenticated,required TResult Function( _Loading value)  loading,}){
final _that = this;
switch (_that) {
case _Authorized():
return authenticated(_that);case _NotAuthorized():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Authorized value)?  authenticated,TResult? Function( _NotAuthorized value)?  notAuthenticated,TResult? Function( _Loading value)?  loading,}){
final _that = this;
switch (_that) {
case _Authorized() when authenticated != null:
return authenticated(_that);case _NotAuthorized() when notAuthenticated != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthUser authUser)?  authenticated,TResult Function()?  notAuthenticated,TResult Function()?  loading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Authorized() when authenticated != null:
return authenticated(_that.authUser);case _NotAuthorized() when notAuthenticated != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthUser authUser)  authenticated,required TResult Function()  notAuthenticated,required TResult Function()  loading,}) {final _that = this;
switch (_that) {
case _Authorized():
return authenticated(_that.authUser);case _NotAuthorized():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthUser authUser)?  authenticated,TResult? Function()?  notAuthenticated,TResult? Function()?  loading,}) {final _that = this;
switch (_that) {
case _Authorized() when authenticated != null:
return authenticated(_that.authUser);case _NotAuthorized() when notAuthenticated != null:
return notAuthenticated();case _Loading() when loading != null:
return loading();case _:
  return null;

}
}

}

/// @nodoc


class _Authorized implements AuthState {
  const _Authorized(this.authUser);
  

 final  AuthUser authUser;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorizedCopyWith<_Authorized> get copyWith => __$AuthorizedCopyWithImpl<_Authorized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Authorized&&(identical(other.authUser, authUser) || other.authUser == authUser));
}


@override
int get hashCode => Object.hash(runtimeType,authUser);

@override
String toString() {
  return 'AuthState.authenticated(authUser: $authUser)';
}


}

/// @nodoc
abstract mixin class _$AuthorizedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthorizedCopyWith(_Authorized value, $Res Function(_Authorized) _then) = __$AuthorizedCopyWithImpl;
@useResult
$Res call({
 AuthUser authUser
});


$AuthUserCopyWith<$Res> get authUser;

}
/// @nodoc
class __$AuthorizedCopyWithImpl<$Res>
    implements _$AuthorizedCopyWith<$Res> {
  __$AuthorizedCopyWithImpl(this._self, this._then);

  final _Authorized _self;
  final $Res Function(_Authorized) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authUser = null,}) {
  return _then(_Authorized(
null == authUser ? _self.authUser : authUser // ignore: cast_nullable_to_non_nullable
as AuthUser,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res> get authUser {
  
  return $AuthUserCopyWith<$Res>(_self.authUser, (value) {
    return _then(_self.copyWith(authUser: value));
  });
}
}

/// @nodoc


class _NotAuthorized implements AuthState {
  const _NotAuthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotAuthorized);
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
