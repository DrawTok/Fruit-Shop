class HouseCodes {
  HouseCodes._();
  
  static final Map<int, String> statusMessages = {
    500: "Invalid token, Unknown errors",
    1001: "Create house successful",
    1002: "Create house failed",
    1003: "House already exist",
    1004: "House not found",
    1005: "Invalid input",
    1006: "Get house details successful",
    1007: "The house list is empty",
    1008: "Get house list successful",
    1009: "Delete house successful",
    1010: "Delete house failed",
    1011: "Update house failed",
    1012: "Update house successful",
    1013: "Update house status successful",
    1014: "Update house status failed",
    1015: "Get house details successful",
    1016: "The user list is empty",
    1017: "Get user has access to house successful",
    1018: "Grant permissions failed",
    1019: "Revoke permissions failed",
    1020: "Grant permissions successful",
  };

  static String getMessage(int code) {
    return statusMessages[code] ?? "Unknown code";
  }
}
