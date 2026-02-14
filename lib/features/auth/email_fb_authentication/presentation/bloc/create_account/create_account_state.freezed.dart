// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateAccountState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateAccountState()';
}


}

/// @nodoc
class $CreateAccountStateCopyWith<$Res>  {
$CreateAccountStateCopyWith(CreateAccountState _, $Res Function(CreateAccountState) __);
}


/// Adds pattern-matching-related methods to [CreateAccountState].
extension CreateAccountStatePatterns on CreateAccountState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Error value)?  error,TResult Function( Loading value)?  loading,TResult Function( Success value)?  success,TResult Function( SuccessWithIncompleteProfile value)?  successWithIncompleteProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Error() when error != null:
return error(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case SuccessWithIncompleteProfile() when successWithIncompleteProfile != null:
return successWithIncompleteProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Error value)  error,required TResult Function( Loading value)  loading,required TResult Function( Success value)  success,required TResult Function( SuccessWithIncompleteProfile value)  successWithIncompleteProfile,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Error():
return error(_that);case Loading():
return loading(_that);case Success():
return success(_that);case SuccessWithIncompleteProfile():
return successWithIncompleteProfile(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Error value)?  error,TResult? Function( Loading value)?  loading,TResult? Function( Success value)?  success,TResult? Function( SuccessWithIncompleteProfile value)?  successWithIncompleteProfile,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Error() when error != null:
return error(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case SuccessWithIncompleteProfile() when successWithIncompleteProfile != null:
return successWithIncompleteProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( Failure failure)?  error,TResult Function()?  loading,TResult Function()?  success,TResult Function()?  successWithIncompleteProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Error() when error != null:
return error(_that.failure);case Loading() when loading != null:
return loading();case Success() when success != null:
return success();case SuccessWithIncompleteProfile() when successWithIncompleteProfile != null:
return successWithIncompleteProfile();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( Failure failure)  error,required TResult Function()  loading,required TResult Function()  success,required TResult Function()  successWithIncompleteProfile,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Error():
return error(_that.failure);case Loading():
return loading();case Success():
return success();case SuccessWithIncompleteProfile():
return successWithIncompleteProfile();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( Failure failure)?  error,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function()?  successWithIncompleteProfile,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Error() when error != null:
return error(_that.failure);case Loading() when loading != null:
return loading();case Success() when success != null:
return success();case SuccessWithIncompleteProfile() when successWithIncompleteProfile != null:
return successWithIncompleteProfile();case _:
  return null;

}
}

}

/// @nodoc


class Initial implements CreateAccountState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateAccountState.initial()';
}


}




/// @nodoc


class Error implements CreateAccountState {
  const Error(this.failure);
  

 final  Failure failure;

/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'CreateAccountState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $CreateAccountStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(Error(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class Loading implements CreateAccountState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateAccountState.loading()';
}


}




/// @nodoc


class Success implements CreateAccountState {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateAccountState.success()';
}


}




/// @nodoc


class SuccessWithIncompleteProfile implements CreateAccountState {
  const SuccessWithIncompleteProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessWithIncompleteProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateAccountState.successWithIncompleteProfile()';
}


}




// dart format on
