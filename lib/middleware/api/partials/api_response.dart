part of '../api.dart';

/// คลาสสำหรับจัดการผลลัพธ์ที่ตอบกลับจาก API ส่วนมากจะได้รับอ็อปเจคนี้จากฟังก์ชันภายใน [ApiClient]
class ApiResponse {
  final Response? _response;
  final DioException? _error;

  ApiResponse._instantiate(this._response, [this._error]);

  /// รหัสสถานะ HTTP
  int? get statusCode => _response?.statusCode;

  /// ข้อความแจ้งเตือนจาก API ซึ่งได้รับมาจากเพย์โหลด JSON บนฟิลด์ที่มี่ชื่อว่า <i>"message"</i>
  String? get message {
    final d = _response?.data;
    final s = d is Map<String, dynamic> && d.containsKey('message') ? d['message'] : null;

    return s is String ? s : null;
  }

  /// เพย์โหลดที่ได้รับจาก API
  dynamic get body => _response?.data;

  /// ข้อมูล API ซึ่งได้รับมาจากเพย์โหลด JSON บนฟิลด์ที่มี่ชื่อว่า <i>"data"</i>
  dynamic get data {
    final d = _response?.data;

    return d is Map<String, dynamic> && d.containsKey('data') ? d['data'] : null;
  }

  /// ข้อมูลที่ได้รับ API หากเพย์โหลดไม่มีฟิลด์ <i>"data"</i> อยู่ จะนำข้อมูลจากเพย์โหลดมาใช้แทน
  ///
  ///__แนะนำให้ใช้ข้อมูลจากฟิลด์นี้__
  dynamic get dataOrBody => data ?? _response?.data;

  /// อ็อปเจค [DioException] แสดงข้อผิดพลาดเมื่อมีการเรียกใช้ API
  DioException? get error => _error;

  /// อ็อปเจค [Response] แสดงผลลัพธ์หลังจากเรียกใช้ API
  Response? get response => _response;
}
