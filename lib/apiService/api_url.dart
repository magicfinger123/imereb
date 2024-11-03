class AppUrls {
  static const baseUrl = "https://app.bseducativo.com";
  static const loginUser = '$baseUrl/pew_api/api/auth';

  static const getListOfMessageInboxUrl = '$baseUrl/pew_api/api/inbox';
  static const getInboxMessageData = '$baseUrl/pew_api/api/mensaje';
  static const deletedMessages = '$baseUrl/pew_api/api/deleted';
  static const sentMessages = '$baseUrl/pew_api/api/sent';
  static const readMessages = '$baseUrl/pew_api/api/mensajeleido';
  static const deleteMessages = '$baseUrl/pew_api/api/eliminarmensajeentrada';
  static const deleteSentMessages = '$baseUrl/pew_api/api/eliminarmensajesalida';
  static const getMessageAttachment = '$baseUrl/pew_api/api/getmsgattach';
  static const getUnreadCount = '$baseUrl/pew_api/api/newmessagecount';

  static const getDocuments = '$baseUrl/pew_api/api/documents';
  static const getAgenda = '$baseUrl/pew_api/api/agenda';
  static const getAgendaDetail = '$baseUrl/pew_api/api/agendadetalle';
  static const meeteligiblelist = '$baseUrl/pew_api/api/meeteligiblelist';
  static const meetapllyfor = '$baseUrl/pew_api/api/meetapllyfor';
  static const meetaAll = '$baseUrl/pew_api/api/meetall';
  static const ec = '$baseUrl/pew_api/api/estado';
  static const note = '$baseUrl/pew_api/api/notas';
  static const noteDetails = '$baseUrl/pew_api/api/notasdetalle';
  static const boletin = '$baseUrl/pew_api/api/boletin';
  static const tips = '$baseUrl/pew_api/api/estugettips';
  static const studentQR = '$baseUrl/pew_api/api/getstudentqr';
  static const studentAlerts = '$baseUrl/pew_api/api/getstudentalert';
  static const couponCategory = '$baseUrl/pew_api/api/cuponcategoryget';
  static const couponGet = '$baseUrl/pew_api/api/CuponGet';

}
class ApiResponseCodes {
  static const success = 200;
  static const error = 400;
  static const internalServerError = 500;
  static const authorizationError = 401;
  static const invalidData = 404;
  static const newDevice = 180;
  static const incompleteRegistration = 190;
  static const changePassword = -60;
}