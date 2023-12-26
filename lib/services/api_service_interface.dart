
import '../model/fake_excel_dto.dart';

abstract class ApiServiceInterface {
  Future<List<FakeExcelDto>> fetchData();
}
