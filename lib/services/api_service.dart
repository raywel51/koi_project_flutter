import 'dart:convert';

import '../model/fake_excel_dto.dart';
import 'api_service_interface.dart';
import 'http_service_google.dart';


class ApiService implements ApiServiceInterface {
  @override
  Future<List<FakeExcelDto>> fetchData() async {
    try {
      final response = await HttpServiceGoogle.getRequest('/macros/echo?user_content_key=YtiU9VOVmLD2t2MQfzaJ_86Kp6nTN9qPNO1JgNDd9SgtZJ96XGdj0kpXLQp_JfAiWnu63Z2m6VTVw_Cpwtj-dq9x-tcJYAa5m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnC_OgmT6cp65fzD7CSHDlxOrMZFRiKoBbqrDHoo5qhGQRMTfMSDyFj5p09lakTqxCRhh4wFfRqSiTV8jCDhYCn7n6oMV7BTxmtz9Jw9Md8uu&lib=MCqtzRpUbzPAv5UZSauo9rnoLM9bSnHJz');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData
            .map((item) => FakeExcelDto.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}


