import 'dart:convert';
import 'package:http/http.dart' as http;

///  연습문제 7 - 실전! 약국 정보 가져오기
void main() {
  infoStore();
}

/// 약국 정보 가져오기
void infoStore() async {
  try {
    String url = 'http://104.198.248.76:3000/mask';
    List<Store> storeList = await fetchStores(url: url);

    for (var store in storeList) {
      print(store);
    }
  } catch (e) {
    print('상점 정보를 가져오는 중 오류가 발생했습니다: $e');
  }
}

Future<List<Store>> fetchStores({required String url}) async {
  final response = await http.get(Uri.parse(url));

  // 응답이 성공적인지 확인
  if (response.statusCode == 200) {

    // UTF-8로 디코딩
    String responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> jsonData = jsonDecode(responseBody);

    // 'stores' 키에 해당하는 값 가져오기
    List<dynamic> storeData = jsonData['stores'];

    // Store 객체로 변환하여 리스트에 저장
    List<Store> stores = storeData.map((item) => Store.fromJson(item)).toList();
    return stores;
  } else {
    // 응답이 실패한 경우 예외 발생
    throw Exception('상점 정보를 가져오는데 실패했습니다: ${response.statusCode}');
  }
}


class Store {
  String addr;
  String code;
  String createdAt;
  double lat;
  double lng;
  String name;
  String remainStat;
  String stockAt;
  String type;

  Store({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      addr: json['addr'] ?? '',
      code: json['code'] ?? '',
      createdAt: json['created_at'] ?? '',
      lat: json['lat'].toDouble() ?? 0.0,
      lng: json['lng'].toDouble() ?? 0.0,
      name: json['name'] ?? '',
      remainStat: json['remain_stat'] ?? '',
      stockAt: json['stock_at'] ?? '',
      type: json['type'] ?? '',
    );
  }
  @override
  String toString() {
    return 'Store{addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt, type: $type}';
  }
}
