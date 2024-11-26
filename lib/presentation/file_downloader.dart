import 'package:dio/dio.dart';

class FileDownloader {
  final Dio _dio;

  FileDownloader({String? bearerToken})
      : _dio = Dio(
          BaseOptions(
            headers: bearerToken != null
                ? {'Authorization': 'Bearer $bearerToken'}
                : null,
          ),
        );

  Future<void> downloadFile(
    String url,
    String savePath, {
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      await _dio.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
      print('Archivo descargado exitosamente en $savePath');
    } catch (e) {
      print('Error al descargar el archivo: $e');
    }
  }
}
