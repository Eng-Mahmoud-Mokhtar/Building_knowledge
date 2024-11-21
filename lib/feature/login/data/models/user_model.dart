class LoginModel {
  final String email;
  final String password;
  final String? errorMessage;
  final bool loginSuccess;
  final bool logoutSuccess;
  final String? token;

  LoginModel({
    this.email = '',
    this.password = '',
    this.errorMessage,
    this.loginSuccess = false,
    this.logoutSuccess = false,
    this.token,
  });

  LoginModel copyWith({
    String? email,
    String? password,
    String? errorMessage,
    bool? loginSuccess,
    bool? logoutSuccess,
    String? token,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      logoutSuccess: logoutSuccess ?? this.logoutSuccess,
      token: token ?? this.token,
    );
  }
}
