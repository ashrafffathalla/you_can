class AutomationApi {
  static const baseUrl = "https://youcan-academy.com/public/api/v1";

  //**************** Authentication *******************//
  static const studentLoginUrl = baseUrl + "/student/auth/login"; //post
  static const registerUrl = baseUrl + "/student/auth/register"; //post
  static const checkOtpRegisterUrl = baseUrl + "/check_otp"; //post
  static const changePhoneUrl = baseUrl + "/change_phone"; //post
  static const countriesUrl = baseUrl + "/countries"; //get
  static const forgetUrl = baseUrl + "/forget_password"; //post
  static const changePasswordUrl = baseUrl + "/change_password"; //post
  static const updateAllProfileUrl = baseUrl + "/student/auth/profile?_method=put"; //post
  static const profileUrl = baseUrl + "/student/auth/profile"; //post

//**************** LEVELS *******************//
  static const levels = baseUrl + "/student/api/levels"; //get
  static const lessonsInLevels = baseUrl + "/student/api/levels/lesson/"; //get
  static const enrollment = baseUrl + "/student/api/level-enrollment"; //get

//*********************Comments***********************//

  static const addComment = baseUrl + "/student/api/comment/store";//post

  //*********************Exams***********************//
  static const exams = baseUrl + "/student/api/exams"; //get


}

