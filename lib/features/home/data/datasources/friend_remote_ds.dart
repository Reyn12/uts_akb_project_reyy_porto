import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';
import '../models/friend_model.dart';

abstract class FriendRemoteDataSource {
  Future<List<FriendModel>> getFriends();
}

class FriendRemoteDataSourceImpl implements FriendRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  FriendRemoteDataSourceImpl({required this.client, required this.baseUrl});

  @override
  Future<List<FriendModel>> getFriends() async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/friends'));

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        try {
          final data =
              responseBody is List<dynamic> ? responseBody : responseBody[0];
          print('Data yang akan diparse ke model: $data');
          return List<FriendModel>.from(
            data.map((x) => FriendModel.fromJson(x)),
          );
        } catch (e, stackTrace) {
          print('Error saat parsing JSON ke model: $e');
          print('Stack trace: $stackTrace');
          rethrow;
        }
      } else {
        throw ServerException(
          message: responseBody['message'] ?? 'Gagal mengambil data teman',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw ServerException(
        message:
            e is ServerException
                ? e.message
                : 'Terjadi kesalahan saat mengambil data teman',
        statusCode: e is ServerException ? e.statusCode : null,
      );
    }
  }
}
