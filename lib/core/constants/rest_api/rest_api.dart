class RestApi {
  RestApi._();

  static String restApiEncoding = 'application/json; charset=utf-8';
  static String firebaseAuthorizationHeaderName = 'X-Authorization-Firebase';

  static int responseSuccessful = 200;
  static int responseNoContent = 204;
  static int responseException = 500;
  static int responseBadRequest = 400;
}