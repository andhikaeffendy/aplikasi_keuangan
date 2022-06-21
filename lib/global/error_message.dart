class ErrorMessage {
  static final String error_500 =
      "Wah, sistem kami error. Maaf sekali atas ketidaknyamanan kamu. Coba refresh atau hubungi customer service kami ya.";
  static final String error_504 = "Server timeout";
  static final String error_404 = "Server tidak ditemukan";
  static final String error_403 = "URL tidak diperbolehkan";
  static final String error_401 = "Token not valid/authorized";
  static final String error_400 = "Reques tidak sesuai";
  static final String error_0 =
      "Wah, sepertinya jaringan kamu bermasalah. Coba refresh, ya.";
  static final String error_1 = "Cancel Upload";

  static String getMessage(int errorCode) {
    switch (errorCode) {
      case 504:
        return error_500;
      case 404:
        return error_404;
      case 403:
        return error_403;
      case 401:
        return error_401;
      case 400:
        return error_400;
      case 0:
        return error_0;
      case 1:
        return error_1;
      default:
        return error_500;
    }
  }
}
