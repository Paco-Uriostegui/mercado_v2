// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyEmailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailEvent()';
}


}

/// @nodoc
class $VerifyEmailEventCopyWith<$Res>  {
$VerifyEmailEventCopyWith(VerifyEmailEvent _, $Res Function(VerifyEmailEvent) __);
}


/// Adds pattern-matching-related methods to [VerifyEmailEvent].
extension VerifyEmailEventPatterns on VerifyEmailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnVerifiedPressed value)?  onVerifiedPressed,TResult Function( ResendVerificationEmail value)?  resendVerificationEmail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnVerifiedPressed() when onVerifiedPressed != null:
return onVerifiedPressed(_that);case ResendVerificationEmail() when resendVerificationEmail != null:
return resendVerificationEmail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnVerifiedPressed value)  onVerifiedPressed,required TResult Function( ResendVerificationEmail value)  resendVerificationEmail,}){
final _that = this;
switch (_that) {
case OnVerifiedPressed():
return onVerifiedPressed(_that);case ResendVerificationEmail():
return resendVerificationEmail(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnVerifiedPressed value)?  onVerifiedPressed,TResult? Function( ResendVerificationEmail value)?  resendVerificationEmail,}){
final _that = this;
switch (_that) {
case OnVerifiedPressed() when onVerifiedPressed != null:
return onVerifiedPressed(_that);case ResendVerificationEmail() when resendVerificationEmail != null:
return resendVerificationEmail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onVerifiedPressed,TResult Function()?  resendVerificationEmail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnVerifiedPressed() when onVerifiedPressed != null:
return onVerifiedPressed();case ResendVerificationEmail() when resendVerificationEmail != null:
return resendVerificationEmail();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onVerifiedPressed,required TResult Function()  resendVerificationEmail,}) {final _that = this;
switch (_that) {
case OnVerifiedPressed():
return onVerifiedPressed();case ResendVerificationEmail():
return resendVerificationEmail();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onVerifiedPressed,TResult? Function()?  resendVerificationEmail,}) {final _that = this;
switch (_that) {
case OnVerifiedPressed() when onVerifiedPressed != null:
return onVerifiedPressed();case ResendVerificationEmail() when resendVerificationEmail != null:
return resendVerificationEmail();case _:
  return null;

}
}

}

/// @nodoc


class OnVerifiedPressed implements VerifyEmailEvent {
  const OnVerifiedPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnVerifiedPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailEvent.onVerifiedPressed()';
}


}




/// @nodoc


class ResendVerificationEmail implements VerifyEmailEvent {
  const ResendVerificationEmail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendVerificationEmail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailEvent.resendVerificationEmail()';
}


}




// dart format on
