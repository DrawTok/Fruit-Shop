class UserCodes {
  UserCodes._();
  static Map<int, String> statusMessages = {
    500: "Invalid Token, Unknown errors",
    1001: "Users found",
    1002: "No users found",
    1003: "Login successful",
    1004: "Invalid username or password",
    1005: "Invalid input",
    1006: "User already exists",
    1007: "Signup successful",
    1008: "Failed to create user",
    1009: "Failed to send email verification code",
    1010: "Account verified successfully",
    1011: "Invalid verification code",
    1012: "Send code success",
    1013: "Password reset successfully",
    1014: "Password updated successfully",
    1015: "Invalid old password",
    1016: "Profile updated successfully",
    1017: "Invalid user",
    1018: "Please verify your account first",
    1019: "Your account has been disabled",
  };

  static String getMessage(int code) {
    return statusMessages[code] ?? "Unknown code";
  }
}
