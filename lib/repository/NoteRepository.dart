import 'package:bs_educativo/model/request/NotasDetailer.dart';
import 'package:bs_educativo/model/response/note/Notas.dart';
import 'package:bs_educativo/repository/repository.dart';
import 'package:injectable/injectable.dart';

import '../ApiService/api_url.dart';
import '../apiService/api_service.dart';

@Injectable()
class NoteRepository extends ApiRepository {
  Future<Object> getNotes(NotasDetailerRequest request) async {
    var response = await postRequest(
        request, AppUrls.note, true, HttpMethods.get);
    if (response is String) {
      var r = notasFromJson(response);
      print("messages: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
  Future<Object> getNoteDetails(NotasDetailerRequest request) async {
    var response = await postRequest(
        request, AppUrls.noteDetails, true, HttpMethods.get);
    if (response is String) {
      var r = notasFromJson(response);
      print("messages: ${r}");
      return r;
    }
    else {
      handleErrorResponse(response);
      return errorResponse!;
    }
  }
}