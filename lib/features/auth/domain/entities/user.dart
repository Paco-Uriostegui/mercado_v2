class User {
  final String uid;
  final String? email;
  final String? profileImageLocalPath;

  const User({
    required this.uid,
    this.email,
    this.profileImageLocalPath,
  });
}