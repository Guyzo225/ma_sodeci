import 'package:sodeci_mobile/interfaces/ToJsonInterface.dart';

class DataRequest<T extends ToJsonInterface> {
  final T data;
  final List<T> datas;
  final String user;
  final int size;
  final int index;
  DataRequest({this.user,this.data,this.size,this.datas,this.index});

  factory DataRequest.fromJson(Map<String, dynamic> json) {
    return DataRequest(
      user: json['user'] == null ? null : json['user'],
      size: json['size'] == null ? null : json['size'],
      index: json['index'] == null ? null : json['index'],
      data: json['data'],
      datas: json["datas"] == null ? null : new List<T>.from(json["datas"].map((x) => x.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user == null ? null : user,
      'size': size == null ? null : size,
      'index': index == null ? null : index,
      'data': data == null ? null:this.data.toJson(),
      'datas':datas == null ? null: new List<dynamic>.from(datas.map((x) => x.toJson())),
    };
  }

}