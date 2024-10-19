class AppUrls {
  static const baseUrl = "https://app.bseducativo.com";//"https://invest-api.coretechzone.com";//"https://stock-api.coretechzone.com";
  static const loginUser = '$baseUrl/pew_api/api/auth';
  static const getListOfMessageUrl = '$baseUrl/pew_api/api/inbox';
}
class ApiResponseCodes {
  static const success = 200;
  static const error = 400;
  static const internalServerError = 500;
  static const authorizationError = 401;
  static const invalidData = 404;
  static const newDevice = 180;
  static const incompleteRegistration = 190;
  static const changePassword = -60;
}