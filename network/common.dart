import '../common/app_config.dart';
import '../utils/exceptions.dart';
import 'package:dio/dio.dart';

const String genericErrorMsg = 'Something went wrong. Please try again!';

Map<String, String> _authHeader(String token) => <String, String>{
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

// TODO modify timeout as needed
BaseOptions requestOptions([String token]) => BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: 15000,
      receiveTimeout: 30000,
      headers: token == null ? null : _authHeader(token),
      validateStatus: (status) => status < 500,
    );

/// This function acts as a gate-keeper.
///
/// If the server returns any error, it throws the proper exception and stops
/// the execution of the rest of the code.
/// Any code that needs to be ran when the response is successful must be placed
/// after this function call.
///
/// ```dart
/// final response = await Dio(requestOptions()).get('url');
/// try {
///   checkErrors(response);
///   /* Some code to process a successful response */
/// } catch (e) {
///   /* Rethrown to handle the exception properly in the UI */
///   rethrow;
/// }
/// ```
void checkErrors(Response response, [String errorMsg]) {
  if (response.statusCode == 500) {
    // Unhandled error: 500
    throw ApiException(message: errorMsg ?? genericErrorMsg);
  }

  // Gate clause, nothing to do if request successful
  if (response.data['status'] == 'success') {
    return;
  }

  final code = response.data['payload']['code'] as String ?? '';
  switch (code) {
    default:
      throw ApiException(
        message:
            response.data['payload']['message'] as String ?? genericErrorMsg,
        code: code,
      );
  }
}
