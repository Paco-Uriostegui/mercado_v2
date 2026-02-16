// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'newcreate_account_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewCreateAccountEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewCreateAccountEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewCreateAccountEvent()';
}


}

/// @nodoc
class $NewCreateAccountEventCopyWith<$Res>  {
$NewCreateAccountEventCopyWith(NewCreateAccountEvent _, $Res Function(NewCreateAccountEvent) __);
}


/// Adds pattern-matching-related methods to [NewCreateAccountEvent].
extension NewCreateAccountEventPatterns on NewCreateAccountEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateAccountSubmitted value)?  createAccountSubmitted,TResult Function( LoginButtonPressed value)?  loginButtonPressed,TResult Function( RestorePasswordButtonPressed value)?  restorePasswordButtonPressed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateAccountSubmitted() when createAccountSubmitted != null:
return createAccountSubmitted(_that);case LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed(_that);case RestorePasswordButtonPressed() when restorePasswordButtonPressed != null:
return restorePasswordButtonPressed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateAccountSubmitted value)  createAccountSubmitted,required TResult Function( LoginButtonPressed value)  loginButtonPressed,required TResult Function( RestorePasswordButtonPressed value)  restorePasswordButtonPressed,}){
final _that = this;
switch (_that) {
case CreateAccountSubmitted():
return createAccountSubmitted(_that);case LoginButtonPressed():
return loginButtonPressed(_that);case RestorePasswordButtonPressed():
return restorePasswordButtonPressed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateAccountSubmitted value)?  createAccountSubmitted,TResult? Function( LoginButtonPressed value)?  loginButtonPressed,TResult? Function( RestorePasswordButtonPressed value)?  restorePasswordButtonPressed,}){
final _that = this;
switch (_that) {
case CreateAccountSubmitted() when createAccountSubmitted != null:
return createAccountSubmitted(_that);case LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed(_that);case RestorePasswordButtonPressed() when restorePasswordButtonPressed != null:
return restorePasswordButtonPressed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  createAccountSubmitted,TResult Function()?  loginButtonPressed,TResult Function()?  restorePasswordButtonPressed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateAccountSubmitted() when createAccountSubmitted != null:
return createAccountSubmitted(_that.email,_that.password);case LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed();case RestorePasswordButtonPressed() when restorePasswordButtonPressed != null:
return restorePasswordButtonPressed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  createAccountSubmitted,required TResult Function()  loginButtonPressed,required TResult Function()  restorePasswordButtonPressed,}) {final _that = this;
switch (_that) {
case CreateAccountSubmitted():
return createAccountSubmitted(_that.email,_that.password);case LoginButtonPressed():
return loginButtonPressed();case RestorePasswordButtonPressed():
return restorePasswordButtonPressed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  createAccountSubmitted,TResult? Function()?  loginButtonPressed,TResult? Function()?  restorePasswordButtonPressed,}) {final _that = this;
switch (_that) {
case CreateAccountSubmitted() when createAccountSubmitted != null:
return createAccountSubmitted(_that.email,_that.password);case LoginButtonPressed() when loginButtonPressed != null:
return loginButtonPressed();case RestorePasswordButtonPressed() when restorePasswordButtonPressed != null:
return restorePasswordButtonPressed();case _:
  return null;

}
}

}

/// @nodoc


class CreateAccountSubmitted implements NewCreateAccountEvent {
  const CreateAccountSubmitted({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of NewCreateAccountEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAccountSubmittedCopyWith<CreateAccountSubmitted> get copyWith => _$CreateAccountSubmittedCopyWithImpl<CreateAccountSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAccountSubmitted&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'NewCreateAccountEvent.createAccountSubmitted(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $CreateAccountSubmittedCopyWith<$Res> implements $NewCreateAccountEventCopyWith<$Res> {
  factory $CreateAccountSubmittedCopyWith(CreateAccountSubmitted value, $Res Function(CreateAccountSubmitted) _then) = _$CreateAccountSubmittedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$CreateAccountSubmittedCopyWithImpl<$Res>
    implements $CreateAccountSubmittedCopyWith<$Res> {
  _$CreateAccountSubmittedCopyWithImpl(this._self, this._then);

  final CreateAccountSubmitted _self;
  final $Res Function(CreateAccountSubmitted) _then;

/// Create a copy of NewCreateAccountEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(CreateAccountSubmitted(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginButtonPressed implements NewCreateAccountEvent {
  const LoginButtonPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginButtonPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewCreateAccountEvent.loginButtonPressed()';
}


}




/// @nodoc


class RestorePasswordButtonPressed implements NewCreateAccountEvent {
  const RestorePasswordButtonPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestorePasswordButtonPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewCreateAccountEvent.restorePasswordButtonPressed()';
}


}




// dart format on
