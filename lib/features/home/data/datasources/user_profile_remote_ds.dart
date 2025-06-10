import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';
import '../models/user_profile_model.dart';

abstract class UserProfileRemoteDataSource {
  Future<UserProfileModel> getUserProfile();
}

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  UserProfileRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<UserProfileModel> getUserProfile() async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/user_profile'));

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        try {
          final data =
              responseBody is Map<String, dynamic>
                  ? responseBody
                  : responseBody[0];
          print('Data yang akan diparse ke model: $data');
          return UserProfileModel.fromJson(data);
        } catch (e, stackTrace) {
          print('Error saat parsing JSON ke model: $e');
          print('Stack trace: $stackTrace');
          rethrow;
        }
      } else {
        throw ServerException(
          message: responseBody['message'] ?? 'Gagal mengambil data profil',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw ServerException(
        message:
            e is ServerException
                ? e.message
                : 'Terjadi kesalahan yang tidak terduga',
        statusCode: e is ServerException ? e.statusCode : null,
      );
    }
  }
}

// Tanggal : 10 Juni 2025
// Nama : Muhammad Renaldi Maulana
// NIM : 10122002
// Kelas : IF-1
