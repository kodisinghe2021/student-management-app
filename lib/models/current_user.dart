class UserData {
  String userId;
  String userEmail;

  UserData({required this.userEmail, required this.userId});
}

class CurrentUserData {
  late UserData currentUser;

  void _setUser(String email, String useId) {
    currentUser = UserData(userEmail: email, userId: useId);
  }

  
}
