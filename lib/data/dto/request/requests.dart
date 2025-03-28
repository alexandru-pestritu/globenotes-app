class LoginRequest {
  String email;
  String password;
  LoginRequest(this.email, this.password);
}

class SocialLoginRequest {
  String idToken;
  SocialLoginRequest(this.idToken);
}

class RegisterRequest {
  String name;
  String email;
  String password;
  RegisterRequest(this.name, this.email, this.password);
}

class VerifyEmailRequest {
  String email;
  String code;
  VerifyEmailRequest(this.email, this.code);
}

class ResendVerifyEmailRequest {
  String email;
  ResendVerifyEmailRequest(this.email);
}

class ForgotPasswordRequest {
  String email;
  ForgotPasswordRequest(this.email);
}

class VerifyForgotPasswordRequest {
  String email;
  String code;
  VerifyForgotPasswordRequest(this.email, this.code);
}

class ResetPasswordRequest {
  String email;
  String code;
  String password;
  ResetPasswordRequest(this.email, this.code, this.password);
}